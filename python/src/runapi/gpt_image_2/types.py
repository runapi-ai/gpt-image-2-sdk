"""GPT Image 2 model lists, enums, and response models."""

from __future__ import annotations

from runapi.core import BaseModel, TaskResponse, optional, required

MODELS = ["gpt-image-2"]
GENERATION_MODELS = MODELS
EDIT_MODELS = MODELS

ASPECT_RATIOS = ["auto", "1:1", "9:16", "16:9", "4:3", "3:4"]
RESOLUTIONS = ["1k", "2k", "4k"]


class Image(BaseModel):
    url = optional(str)


class TextToImageResponse(TaskResponse):
    """Task status/result for GPT Image 2 text-to-image."""
    id = required(str)
    status = optional(str, enum=lambda: TaskResponse.Status.ALL)
    images = optional([lambda: Image])
    error = optional(str)


EditImageResponse = TextToImageResponse


class CompletedTextToImageResponse(TextToImageResponse):
    """Narrowed response from ``run()`` once polling observes completion."""

    images = required([lambda: Image])


CompletedEditImageResponse = CompletedTextToImageResponse
