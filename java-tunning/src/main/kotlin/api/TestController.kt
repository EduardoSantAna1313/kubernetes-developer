package br.com.edu.api

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.lang.Math.pow
import kotlin.math.*

@RequestMapping("/v1")
@RestController
class TestController {

    @GetMapping("/test")
    fun test(@RequestParam(value = "value", required = false, defaultValue = "3.5") value: Double) : ResponseEntity<String> {

        println("Iniciando calculo")
        var result: Double = calculate(value)

        println("fim calculo")
        return ResponseEntity.ok("Value: $result")
    }

    fun calculate(value: Double): Double {
        var result: Double = 1.0
        for (i in 1..10_000_000) {
            result *= 1.123456.pow(sin(value) * cos(value) / tan(value)) / (atan(value))
        }
        return result * atan(cos(sin(value))) * 3 * PI
    }

}
