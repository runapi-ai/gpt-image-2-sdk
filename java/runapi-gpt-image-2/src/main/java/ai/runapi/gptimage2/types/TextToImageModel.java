package ai.runapi.gptimage2.types;

import com.fasterxml.jackson.annotation.JsonCreator;

/** Model slug for text to image operations. */
public final class TextToImageModel extends Gptimage2Value {
  /** gpt-image-2 model slug. */
  public static final TextToImageModel GPT_IMAGE_2 = new TextToImageModel("gpt-image-2");

  /** Creates a model value from a literal model slug. */
  @JsonCreator
  public TextToImageModel(String value) {
    super(value);
  }
}
