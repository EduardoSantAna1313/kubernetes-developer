package br.com.edu.kyverno

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class KyvernoApplication

fun main(args: Array<String>) {
	runApplication<KyvernoApplication>(*args)
}
