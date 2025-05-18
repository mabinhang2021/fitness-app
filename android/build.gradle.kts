allprojects {
    repositories {
        google()  // 确保有这个
        mavenCentral()  // 确保有这个
        maven(url = "https://storage.googleapis.com/download.flutter.io")  // Flutter 官方仓库
        maven(url = "https://maven.aliyun.com/repository/public")  // 阿里云镜像，加速访问
        maven(url = "https://maven.aliyun.com/repository/google")  // Google 依赖
        maven(url = "https://maven.aliyun.com/repository/gradle-plugin")  // Gradle 插件仓库
    }
}
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
