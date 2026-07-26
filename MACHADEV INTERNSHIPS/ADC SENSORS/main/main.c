#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/adc.h"
#include "esp_log.h"
#define ADC_CHANNEL ADC_CHANNEL_6   // GPIO34 (ADC1 Channel 6)
#define TAG "ADC_SENSOR"
void app_main(void)
{
    // Configure ADC Width (12-bit resolution)
    adc1_config_width(ADC_WIDTH_BIT_12);
    // Configure ADC Channel Attenuation (0-3.3V)
    adc1_config_channel_atten(ADC_CHANNEL, ADC_ATTEN_DB_11);
    while (1) {
        // Read ADC Raw Value
        int adc_reading = adc1_get_raw(ADC_CHANNEL);
        // Convert Raw Value to Voltage
        float voltage = adc_reading * (3.3 / 4095);
        // Print Reading
        ESP_LOGI(TAG, "ADC Raw: %d | Voltage: %.2f V", adc_reading, voltage);
        // Delay 1 second
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}