package com.example.dimacounter

class CounterLogic {
    var current = 0
    var total = 0

    fun add() {
        current++
        total++
    }

    fun reset() {
        current = 0
    }

    fun total(): Int {
        return total
    }

}