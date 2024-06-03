<?php

use PHPUnit\Framework\TestCase;

require_once 'TemperatureConverter.php';

class TemperatureConverterTest extends TestCase
{
    public function testCelsiusToFahrenheit()
    {
        $converter = new TemperatureConverter();
        $this->assertEquals(32, $converter->celsiusToFahrenheit(0));
        $this->assertEquals(212, $converter->celsiusToFahrenheit(100));
    }

    public function testFahrenheitToCelsius()
    {
        $converter = new TemperatureConverter();
        $this->assertEquals(0, $converter->fahrenheitToCelsius(32));
        $this->assertEquals(100, $converter->fahrenheitToCelsius(212));
    }

    public function testCelsiusToKelvin()
    {
        $converter = new TemperatureConverter();
        $this->assertEquals(273.15, $converter->celsiusToKelvin(0));
        $this->assertEquals(373.15, $converter->celsiusToKelvin(100));
    }

    public function testKelvinToCelsius()
    {
        $converter = new TemperatureConverter();
        $this->assertEquals(0, $converter->kelvinToCelsius(273.15));
        $this->assertEquals(100, $converter->kelvinToCelsius(373.15));
    }
}
