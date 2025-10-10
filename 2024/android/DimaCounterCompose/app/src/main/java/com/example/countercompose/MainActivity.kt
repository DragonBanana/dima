package com.example.countercompose

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.countercompose.ui.theme.CounterComposeTheme
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.roundToInt

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterComposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    Counter()
                }
            }
        }
    }
}

@Composable
fun Counter() {
    val context = LocalContext.current
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        val (counter, setCounter) = remember {
            mutableStateOf(Counter(0,0))
        }
        Text(text = counter.current.toString(), fontSize = 30.sp)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.Center,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Button(onClick = {
                setCounter(counter.copy(current = counter.current + 1, total =
                counter.total + 1))
            }) {
                Text(text = "Increase")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(
                enabled = counter.current > 0,
                onClick = {
                    setCounter(counter.copy(current = counter.current - 1))
                }
            ) {
                Text(text = "Decrease")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(onClick = {
                setCounter(counter.copy(current = 0))
            }) {
                Text(text = "Reset")
            }
        }
        Slider(modifier = Modifier.padding(4.dp),
            value = counter.current.toFloat(),
            onValueChange = {
                setCounter(counter.copy(current = it.roundToInt()))
            },
            valueRange = 0.0f.rangeTo(10.0f),
            steps = 9
        )
        Button(
            modifier = Modifier.padding(4.dp),
            onClick = {
                val intent = Intent(context, ResultActivity::class.java)
                intent.putExtra(ResultActivity.EXTRA_KEY, counter)
                context.startActivity(intent)
            }) {
            Text(text = "Total")
        }

        // This is an example of how a coroutine can be launched
        // inside our view
        val scope = rememberCoroutineScope()
        Button(
            modifier = Modifier.padding(4.dp),
            onClick = {
                scope.launch {
                    startTimer(5000L) {
                        setCounter(counter.copy(current = 0))
                    }
                }
            }) {
            Text(text = "Reset delayed")
        }
    }
}

// wait 'time' milliseconds and then execute 'onTimeEnd' lambda
suspend fun startTimer(time: Long, onTimerEnd: () -> Unit) {
    delay(timeMillis = time)
    onTimerEnd()
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    CounterComposeTheme {
        Counter()
    }
}