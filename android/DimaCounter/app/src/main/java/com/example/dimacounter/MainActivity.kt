package com.example.dimacounter

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    private var counter = CounterLogic()
    private var counterTextView: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        counterTextView = findViewById(R.id.counterTextView)
    }

    fun onAddClick(view: View) {
        counter.add()
        counterTextView?.text = counter.current.toString()
//        counterTextView!!.text = counter.toString()
    }

    fun onResetClick(view: View) {
        counter.reset()
        counterTextView?.text = counter.current.toString()
    }

    fun onTotalClick(view: View) {
        val intent = Intent(this, ResultActivity::class.java)
        intent.putExtra(ResultActivity.dataKey, counter.total)
        startActivity(intent)
    }

}