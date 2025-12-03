package it.polimi.dima.counter

import android.os.Bundle
import android.view.View
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    private var counter = 0
    private var textView: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        textView = findViewById<TextView>(R.id.textView)
    }

    fun onAddClick(view: View) {
        counter += 1
        textView?.text = counter.toString()
    }

    fun onSubClick(view: View) {
        counter -= 1
        textView?.text = counter.toString()
    }

    fun onResetClick(view: View) {
        counter = 0
        textView?.text = counter.toString()
    }
}