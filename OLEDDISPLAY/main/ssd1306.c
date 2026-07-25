#include "ssd1306.h"
#include "esp_log.h"
#include <string.h>

static const char *TAG = "SSD1306";

static const uint8_t init_cmds[] = {
    0xAE, 0x20, 0x00, 0x40, 0xB0,
    0xC8, 0x00, 0x10, 0x40, 0x81,
    0xFF, 0xA1, 0xA6, 0xA8, 0x3F,
    0xA4, 0xD3, 0x00, 0xD5, 0xF0,
    0xD9, 0x22, 0xDA, 0x12, 0xDB,
    0x20, 0x8D, 0x14, 0xAF
};

static esp_err_t ssd1306_send_cmd(int i2c_port, int address, uint8_t cmd) {
    uint8_t buf[2] = {0x00, cmd};
    return i2c_master_write_to_device(i2c_port, address, buf, 2, 1000 / portTICK_PERIOD_MS);
}

esp_err_t ssd1306_init(ssd1306_t *dev, int i2c_port, int address) {
    dev->i2c_port = i2c_port;
    dev->address = address;
    memset(dev->buffer, 0, sizeof(dev->buffer));

    for (int i = 0; i < sizeof(init_cmds); i++) {
        esp_err_t err = ssd1306_send_cmd(i2c_port, address, init_cmds[i]);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "Init error at step %d", i);
            return err;
        }
    }
    ESP_LOGI(TAG, "SSD1306 initialized.");
    return ESP_OK;
}

esp_err_t ssd1306_clear_screen(ssd1306_t *dev, bool invert) {
    memset(dev->buffer, (invert ? 0xFF : 0x00), sizeof(dev->buffer));
    return ESP_OK;
}

// Minimal font (for demonstration, not full ASCII)
static const uint8_t font5x7[1][5] = {{0x00,0x00,0x00,0x00,0x00}}; // placeholder

esp_err_t ssd1306_draw_string(ssd1306_t *dev, int x, int y, const uint8_t *text, int size, bool invert) {
    int col = x;
    int row = y / 8;
    while (*text) {
        char c = *text++;
        if (c < 32 || c > 126) c = '?';
        const uint8_t *glyph = font5x7[0]; // placeholder glyph
        for (int i = 0; i < 5; i++) {
            dev->buffer[row * SSD1306_WIDTH + col] = invert ? ~glyph[i] : glyph[i];
            col++;
        }
        col++;
    }
    return ESP_OK;
}

esp_err_t ssd1306_refresh(ssd1306_t *dev, bool invert) {
    for (int page = 0; page < 8; page++) {
        ssd1306_send_cmd(dev->i2c_port, dev->address, 0xB0 + page);
        ssd1306_send_cmd(dev->i2c_port, dev->address, 0x00);
        ssd1306_send_cmd(dev->i2c_port, dev->address, 0x10);

        uint8_t data[SSD1306_WIDTH + 1];
        data[0] = 0x40;
        memcpy(&data[1], &dev->buffer[page * SSD1306_WIDTH], SSD1306_WIDTH);
        i2c_master_write_to_device(dev->i2c_port, dev->address, data, sizeof(data), 1000 / portTICK_PERIOD_MS);
    }
    return ESP_OK;
}
