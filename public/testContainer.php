<?php
require __DIR__ . '/../vendor/autoload.php';
$app = new Illuminate\Foundation\Application(
    dirname(__DIR__)
);

class TestClass
{
    public function fun1($instance, $app)
    {
        var_dump('fun1 ' . get_class($instance) . ' ' . get_class($app));
    }

    public function fun2()
    {
        var_dump( sha1(spl_object_hash($this)) . " fun2");
    }

    public static function static1()
    {
        var_dump("static1");
    }

    public function __invoke(...$arg)
    {
        var_dump( sha1(spl_object_hash($this)) . " __invoke");
    }
}

$app->bindMethod(["TestClass", "fun1"], function ($instance, $app) {
    var_dump('fun1 ' . get_class($instance) . ' ' . get_class($app));
});

$instance = new TestClass();
$app->callMethodBinding('TestClass@fun1', $instance);
$app->call([$instance, "fun1"]);

function simpleFunction()
{
    var_dump("simpleFunction");
}

$app->call('simpleFunction');
$app->call("TestClass@fun1");
$app->call("TestClass@fun2");
$app->call($instance);
$app->call([$instance, "fun2"]);
$app->call([$instance, "static1"]);
$app->call(["TestClass", "static1"]);
$app->call("TestClass::static1");


