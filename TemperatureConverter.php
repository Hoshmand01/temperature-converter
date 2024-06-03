<?php

class TemperatureConverter
{
    public function celsiusToFahrenheit($celsius)
    {
        return ($celsius * 9/5) + 32;
    }

    public function fahrenheitToCelsius($fahrenheit)
    {
        return ($fahrenheit - 32) * 5/9;
    }

    public function celsiusToKelvin($celsius)
    {
        return $celsius + 273.15;
    }

    public function kelvinToCelsius($kelvin)
    {
        return $kelvin - 273.15;
    }
}
