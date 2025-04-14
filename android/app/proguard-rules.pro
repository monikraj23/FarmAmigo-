# Preserve TensorFlow Lite core
-keep class org.tensorflow.** { *; }
-dontwarn org.tensorflow.**

# Preserve TensorFlow Lite GPU
-keep class org.tensorflow.lite.gpu.** { *; }
-dontwarn org.tensorflow.lite.gpu.**

# Prevent obfuscation of all inner classes related to GPU
-keepclassmembers class org.tensorflow.** {
    *;
}

# TensorFlow Lite delegate factory options
-keep class org.tensorflow.lite.gpu.GpuDelegateFactory$Options { *; }
