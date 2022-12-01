package com.example.dimacounter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class ResultActivity : AppCompatActivity() {

    companion object {
        const val dataKey = "RESULT_KEY"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_result)

        val total = intent.getIntExtra(dataKey, 0)

        val totalTextView: TextView = findViewById(R.id.totalTextView)
        totalTextView.text = total.toString()
    }
}