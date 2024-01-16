package br.com.edu

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
open class JavaTuningApp

fun main(args: Array<String>) {
    runApplication<JavaTuningApp>(*args)
    println("availableProcessors: ${Runtime.getRuntime().availableProcessors()}")

}