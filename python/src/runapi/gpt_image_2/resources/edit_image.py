"""GPT Image 2 edit-image resource."""

from __future__ import annotations

from typing import Any, Dict

from runapi.core import Resource, ValidationError

from ..types import (
    ASPECT_RATIOS,
    EDIT_MODELS,
    RESOLUTIONS,
    CompletedEditImageResponse,
    EditImageResponse,
)


class EditImage(Resource):
    """Edit images from a prompt and source images with GPT Image 2."""

    ENDPOINT = "/api/v1/gpt_image_2/edit_image"

    RESPONSE_CLASS = EditImageResponse
    COMPLETED_RESPONSE_CLASS = CompletedEditImageResponse

    def run(self, **params: Any) -> Any:
        """Create an edit-image task and poll until it completes.

        Args:
            **params: Edit-image parameters (model, prompt, ...).

        Returns:
            The completed edit-image response.
        """
        task = self.create(**params)
        return self._poll_until_complete(lambda: self.get(task.id))

    def create(self, **params: Any) -> Any:
        """Create an edit-image task and return immediately with an id.

        Args:
            **params: Edit-image parameters (model, prompt, ...).

        Returns:
            The task creation result with an id.
        """
        compacted = self._compact_params(params)
        self._validate_params(compacted)
        return self._request("post", self.ENDPOINT, body=compacted)

    def get(self, id: str) -> Any:
        """Fetch the current status of an edit-image task.

        Args:
            id: Task id.

        Returns:
            The current edit-image status.
        """
        return self._request("get", f"{self.ENDPOINT}/{id}")

    def _validate_params(self, params: Dict[str, Any]) -> None:
        if not params.get("model"):
            raise ValidationError("model is required")
        if not params.get("prompt"):
            raise ValidationError("prompt is required")

        model = params.get("model")
        if model not in EDIT_MODELS:
            raise ValidationError(f"Invalid model: {model}. Must be: {', '.join(EDIT_MODELS)}")

        urls = params.get("source_image_urls")
        if urls is None or (hasattr(urls, "__len__") and len(urls) == 0):
            raise ValidationError("source_image_urls is required for edit image requests")

        self._validate_optional(params, "aspect_ratio", ASPECT_RATIOS)
        self._validate_optional(params, "output_resolution", RESOLUTIONS)
