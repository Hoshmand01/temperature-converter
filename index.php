<!DOCTYPE html>
<html>
<head>
    <title>Temperature Converter</title>
</head>
<body>
    <h1>Temperature Converter</h1>
    <form method="post" action="">
        <label for="temperature">Temperature:</label>
        <input type="text" id="temperature" name="temperature" required>
        <label for="unit">Convert from:</label>
        <select id="unit" name="unit">
            <option value="celsiusToFahrenheit">Celsius to Fahrenheit</option>
            <option value="fahrenheitToCelsius">Fahrenheit to Celsius</option>
            <option value="celsiusToKelvin">Celsius to Kelvin</option>
            <option value="kelvinToCelsius">Kelvin to Celsius</option>
        </select>
        <button type="submit">Convert</button>
    </form>

    <?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        require 'TemperatureConverter.php';
        $converter = new TemperatureConverter();
        $temperature = $_POST['temperature'];
        $unit = $_POST['unit'];
        $result = $converter->$unit($temperature);
        echo "<p>Result: $result</p>";
    }
    ?>
</body>
</html>
