<?php
$a = (int)$_GET["a"] ?? 0;
$b = (int)$_GET["b"] ?? 0;
$muvelet = $_GET["muvelet"] ?? "";

switch ($muvelet) {
    case 'osszead':
        echo $a + $b;
        break;

    case 'kivon':
        echo $a - $b;
        break;

    case 'szoroz':
        echo $a * $b;
        break;

    default:
        echo "Hiba!";
        break;
}
