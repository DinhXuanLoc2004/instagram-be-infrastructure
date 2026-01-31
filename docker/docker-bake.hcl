group "default" {
    targets = [ "auth-service" ]
}

variable "TARGET" {
    default = "final"
}

variable "TAG" {
    default = "dev"
}

variable "JAVA_VERSION" {
    default = 21

  validation {
    condition = JAVA_VERSION >= 17
    error_message = "JAVA_VERSION >= 17"
  }
}

variable "IMAGE_BASE" {
    default = "eclipse-temurin"
}

variable "RUNTIME_BUILD" {
    default = "jdk"
}

variable "RUNTIME_FINAL" {
    default = "jre"
}

target "java_args" {
    args = {
        IMAGE_BASE = IMAGE_BASE
        JAVA_VERSION = JAVA_VERSION
        RUNTIME_BUILD = RUNTIME_BUILD
        RUNTIME_FINAL = RUNTIME_FINAL
    }
}

target "auth-service" {
    inherits = [ "java_args" ]
    context = "../../auth-service"
    target = TARGET
    tags = [ "auth-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "auth-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "auth service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-auth-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "monitor-service" {
    inherits = [ "java_args" ]
    context = "../../monitor-service"
    target = TARGET
    tags = [ "monitor-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "monitor-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "monitor service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-monitor-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "media-service" {
    context = "../../media-service"
    dockerfile = "Dockerfile.prod"
    target = TARGET
    tags = [ "media-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "media-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "media service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-media-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}



