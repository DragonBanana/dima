package com.example.countercompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import com.example.countercompose.ui.theme.CounterComposeTheme
class ResultActivity : ComponentActivity() {
    companion object {
        const val EXTRA_KEY = "RESULT_ACTIVITY_KEY"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterComposeTheme() {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    val res: Counter? = intent.getParcelableExtra(EXTRA_KEY)
                    res?.let { Result(it) }
                }
            }
        }
    }
}
@Composable
fun Result(result: Counter) {
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Box(modifier = Modifier.size(100.dp)) {
            // download an image from internet asynchrounously and
            // displays it. In this way, the UI does not block waiting
            // for the image to load but instead while it's loading it
            // displays the 'contentDescription' parameter
            AsyncImage(model = "https://tinyurl.com/dima-image", contentDescription =
            "Example image" )
        }
        Spacer(modifier = Modifier.height(20.dp))
        Text(text = "Total is ${result.total}!", fontSize = 30.sp)
    }
}
@Preview(showBackground = true)
@Composable
fun DefaultPreview2() {
    CounterComposeTheme() {
        Result(Counter(0,0))
    }
}