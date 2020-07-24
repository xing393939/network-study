<?php
require __DIR__.'/../vendor/autoload.php';
$app = new Illuminate\Foundation\Application(
    dirname(__DIR__)
);

$app->bindMethod(["stdClass", "fun1"], function ($instance, $app) {
    var_dump('fun1 ' . get_class($instance) . ' ' . get_class($app));
});

$instance = new stdClass();
$app->callMethodBinding('stdClass@fun1', $instance);
$app->call([$instance, "fun1"], []);


