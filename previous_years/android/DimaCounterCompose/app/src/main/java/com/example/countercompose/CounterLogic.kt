package com.example.countercompose

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Counter(var current: Int, var total: Int): Parcelable