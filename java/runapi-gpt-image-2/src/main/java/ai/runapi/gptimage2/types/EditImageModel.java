package ai.runapi.gptimage2.types;

import com.fasterxml.jackson.annotation.JsonCreator;

/** Model slug for edit image operations. */
public final class EditImageModel extends Gptimage2Value {
  /** gpt-image-2 model slug. */
  public static final EditImageModel GPT_IMAGE_2 = new EditImageModel("gpt-image-2");

  /** Creates a model value from a literal model slug. */
  @JsonCreator
  public EditImageModel(String value) {
    super(value);
  }
}
