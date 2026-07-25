#ifndef SSD1306_H
#define SSD1306_H

#include "driver/i2c.h"
#include "esp_err.h"
#include <stdbool.h>
#include <stdint.h>

#define SSD1306_WIDTH 128
#define SSD1306_HEIGHT 64

typedef struct {
    int i2c_port;
    int address;
    uint8_t buffer[SSD1306_WIDTH * SSD1306_HEIGHT / 8];
} ssd1306_t;

esp_err_t ssd1306_init(ssd1306_t *dev, int i2c_port, int address);
esp_err_t ssd1306_clear_screen(ssd1306_t *dev, bool invert);
esp_err_t ssd1306_draw_string(ssd1306_t *dev, int x, int y, const uint8_t *text, int size, bool invert);
esp_err_t ssd1306_refresh(ssd1306_t *dev, bool invert);

#endif
