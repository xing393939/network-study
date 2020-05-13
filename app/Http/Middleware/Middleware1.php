<?php

namespace App\Http\Middleware;

use Closure;

class Middleware1
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        var_dump(__CLASS__);
        $r = $next($request);
        var_dump(__CLASS__);
        return $r;
    }
}
