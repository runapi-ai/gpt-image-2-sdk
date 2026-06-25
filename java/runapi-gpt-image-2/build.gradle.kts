plugins {
  `java-library`
  `maven-publish`
}

description = "RunAPI GPT Image 2 Java SDK for GPT Image 2 workflows."

java {
  withSourcesJar()
  withJavadocJar()
}

dependencies {
  api("ai.runapi:runapi-core:0.1.1")

  testImplementation(platform("org.junit:junit-bom:5.10.3"))
  testImplementation("org.junit.jupiter:junit-jupiter")
}

publishing {
  publications {
    create<MavenPublication>("mavenJava") {
      from(components["java"])
      artifactId = "runapi-gpt-image-2"
      pom {
        name = "RunAPI GPT Image 2 Java SDK"
        description = "RunAPI GPT Image 2 Java SDK for GPT Image 2 workflows."
        url = "https://runapi.ai/models/gpt-image-2"
        licenses {
          license {
            name = "Apache License, Version 2.0"
            url = "https://www.apache.org/licenses/LICENSE-2.0"
          }
        }
        developers {
          developer {
            id = "runapi"
            name = "RunAPI"
            email = "contact@runapi.ai"
          }
        }
        scm {
          url = "https://github.com/runapi-ai/gpt-image-2-sdk"
          connection = "scm:git:https://github.com/runapi-ai/gpt-image-2-sdk.git"
          developerConnection = "scm:git:ssh://git@github.com/runapi-ai/gpt-image-2-sdk.git"
        }
      }
    }
  }
}
