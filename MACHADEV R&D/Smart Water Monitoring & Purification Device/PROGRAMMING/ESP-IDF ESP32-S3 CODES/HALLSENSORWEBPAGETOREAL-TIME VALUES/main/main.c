#include <stdio.h>
#include <string.h>
#include "esp_log.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_http_server.h"
#include "driver/gpio.h"
#define HALL_SENSOR_PIN 4
static const char *TAG = "hall_web";
// HTML page with auto-refresh
static esp_err_t root_get_handler(httpd_req_t *req)
{
    int sensor_val = gpio_get_level(HALL_SENSOR_PIN);
    char resp[256];
    snprintf(resp, sizeof(resp),
             "<!DOCTYPE html><html><head><title>ESP32-S3 Hall Sensor</title>"
             "<meta http-equiv='refresh' content='1'>"
             "<style>body{font-family:Arial;text-align:center;}</style></head>"
             "<body><h1>ESP32-S3 Hall Sensor Data</h1>"
             "<h2>Real-time Value: %d</h2></body></html>", sensor_val);
    httpd_resp_send(req, resp, HTTPD_RESP_USE_STRLEN);
    return ESP_OK;
}

static const httpd_uri_t root = {
    .uri = "/",
    .method = HTTP_GET,
    .handler = root_get_handler,
    .user_ctx = NULL
};

static httpd_handle_t start_webserver(void)
{
    httpd_handle_t server = NULL;
    httpd_config_t config = HTTPD_DEFAULT_CONFIG();
    if (httpd_start(&server, &config) == ESP_OK)
        httpd_register_uri_handler(server, &root);
    return server;
}

void wifi_init_softap(void)
{
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    esp_netif_create_default_wifi_ap();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    wifi_config_t wifi_config = {
        .ap = {
            .ssid = "ESP32S3_AP",
            .ssid_len = strlen("ESP32S3_AP"),
            .channel = 1,
            .password = "12345678",
            .max_connection = 2,
            .authmode = WIFI_AUTH_WPA_WPA2_PSK
        },
    };
    if (strlen("12345678") == 0)
        wifi_config.ap.authmode = WIFI_AUTH_OPEN;

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_AP, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    ESP_LOGI(TAG, "WiFi AP started. SSID:%s Password:%s", wifi_config.ap.ssid, wifi_config.ap.password);
}

void app_main(void)
{
    ESP_ERROR_CHECK(nvs_flash_init());
    gpio_config_t io_conf = {
        .pin_bit_mask = 1ULL << HALL_SENSOR_PIN,
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_ENABLE,
    };
    gpio_config(&io_conf);

    wifi_init_softap();
    start_webserver();
    while (1)
    {
        printf
    }
    
}