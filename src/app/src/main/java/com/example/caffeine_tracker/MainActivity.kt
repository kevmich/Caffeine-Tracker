package com.example.caffeine_tracker

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.ActionBar
import androidx.appcompat.app.AppCompatActivity
import com.github.aachartmodel.aainfographics.aachartcreator.*
import com.github.aachartmodel.aainfographics.aaoptionsmodel.AASeries

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)



        /**
         * Set up custom action bar title
         */
        supportActionBar!!.displayOptions = ActionBar.DISPLAY_SHOW_CUSTOM
        supportActionBar!!.setCustomView((R.layout.action_bar_layout))

        //--------------------------------------------
        val aaChartView = findViewById<AAChartView>(R.id.aa_chart_view)

        val aaChartModel : AAChartModel = AAChartModel()
            .chartType(AAChartType.Line)
            .title("Caffeine Decay Time")
            .subtitle("")
            .backgroundColor("#FFFFFF")
            .yAxisAllowDecimals(true)
            .yAxisTitle("Caffeine in mg")
            .dataLabelsEnabled(true)
            .animationType(AAChartAnimationType.EaseInQuad)
            .animationDuration(2)
            .series(arrayOf(

                AASeriesElement()
                    .name("Time")
                    .data(arrayOf(8.333333, 16.590627, 24.7725, 32.879, 40.913175, 48.873,  64.5759, 72.320, 79.993, 87.596, 95.1309, 94.262, 93.4027, 92.550, 91.7059, 90.869, 90.040, 89.21841,  88.404, 87.597, 86.798, 86.006, 85.2215, 84.4439, 85.06))

                )
            )

        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        //---------------------------------------
    }
}
