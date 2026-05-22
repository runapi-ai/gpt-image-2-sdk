package gptimage2

type TaskStatus string

type TextToImageParams struct {
	Model       string `json:"model" help:"required; gpt-image-2-text-to-image"`
	Prompt      string `json:"prompt" help:"required; text description of the desired image"`
	AspectRatio string `json:"aspect_ratio,omitempty" help:"optional; auto, 1:1, 5:4, 9:16, 21:9, 16:9, 4:3, 3:2, 4:5, 3:4, or 2:3"`
	NSFWChecker *bool  `json:"nsfw_checker,omitempty" help:"optional; content filter toggle"`
	CallbackURL string `json:"callback_url,omitempty" help:"optional; webhook URL"`
}

type EditImageParams struct {
	Model       string   `json:"model" help:"required; gpt-image-2-image-to-image"`
	Prompt      string   `json:"prompt" help:"required; text description of the desired edit"`
	InputURLs   []string `json:"input_urls" help:"required; 1-16 input image URLs"`
	AspectRatio string   `json:"aspect_ratio,omitempty" help:"optional; auto, 1:1, 5:4, 9:16, 21:9, 16:9, 4:3, 3:2, 4:5, 3:4, or 2:3"`
	NSFWChecker *bool    `json:"nsfw_checker,omitempty" help:"optional; content filter toggle"`
	CallbackURL string   `json:"callback_url,omitempty" help:"optional; webhook URL"`
}

type AsyncTaskResponse struct {
	ID     string     `json:"id"`
	Status TaskStatus `json:"status"`
	Error  string     `json:"error,omitempty"`
}

func (r AsyncTaskResponse) GetID() string     { return r.ID }
func (r AsyncTaskResponse) GetStatus() string { return string(r.Status) }
func (r AsyncTaskResponse) GetError() string  { return r.Error }

type Image struct {
	URL string `json:"url"`
}

type TextToImageResponse struct {
	AsyncTaskResponse
	Images []Image `json:"images,omitempty"`
}

type EditImageResponse = TextToImageResponse
