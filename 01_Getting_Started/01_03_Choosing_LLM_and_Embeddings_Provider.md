# Choosing an LLM and Embeddings Provider

Several options are available to you for choosing an LLM and embeddings provider.

You can choose from companies that build and serve their own LLMs, like:

- [OpenAI](https://platform.openai.com/docs/models)

- [Anthropic](https://docs.anthropic.com/claude/docs/models-overview)

- [Cohere](https://docs.cohere.com/docs/the-cohere-platform)

- [Mistral](https://docs.mistral.ai/platform/pricing/)

- [Google Gemini](https://ai.google.dev/)

Or you can choose from companies that host and serve open-source models via an API, like:

- [Fireworks AI](https://fireworks.ai/models)

- [Together AI](https://www.together.ai/pricing)

- [Predibase](https://docs.predibase.com/user-guide/inference/models)

- [Hugging Face](https://huggingface.co/docs/text-generation-inference/en/supported_models)

- [Basten](https://www.baseten.co/library/)

- [Replicate](https://replicate.com/collections/language-models)

- [Lepton AI](https://www.lepton.ai/docs)

- [Clarifai](https://clarifai.com/explore/models)

With countless other providers continuously entering the market and trying to capture a share.

LlamaIndex has integrations with dozens of LLM and Embeddings providers. You can see them all [here](https://github.com/run-llama/llama_index/tree/main/llama-index-integrations/llms).

## Recommended: Cohere Setup

For this course, we recommend using **Cohere** as your primary LLM provider. Here's how to set it up:

### Installation

```bash
# Install Cohere LLM integration for LlamaIndex
pip install llama-index-llms-cohere

# Install Cohere embeddings integration
pip install llama-index-embeddings-cohere

# Install Cohere SDK (if not already installed)
# Note: Version 5.20.2+ recommended (includes rerank v3.5 support)
pip install cohere==5.20.2
```

> **Note**: If you've already run the `install.sh` script, these packages are already installed with the correct versions.

### Basic Usage

```python
from llama_index.llms.cohere import Cohere
from llama_index.embeddings.cohere import CohereEmbedding
from llama_index.core.llms import ChatMessage
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Initialize the LLM
# Note: Cohere deprecated old model names (Sept 2025) - use versioned models
llm = Cohere(
    api_key=os.getenv("CO_API_KEY"),  # Reads from .env file
    model="command-a-03-2025"  # BEST FOR RAG: 256K context, excels at RAG, 150% higher throughput
    # Other RAG options:
    # - "command-a-reasoning-08-2025" (256K context, 32K output - best for complex RAG)
    # - "command-r-plus-08-2024" (128K context, RAG-optimized, proven)
    # - "command-r7b-12-2024" (128K context, fast & efficient)
    # - "command-r-08-2024" (128K context, faster/cheaper)
)

# Initialize embeddings
embeddings = CohereEmbedding(
    api_key=os.getenv("CO_API_KEY"),  # Reads from .env file
    model_name="embed-english-v3.0"  # or "embed-multilingual-v3.0" for multilingual
)

# Use chat() method instead of complete() - Cohere migrated to Chat API
# chat() requires a list of ChatMessage objects, not a plain string
messages = [
    ChatMessage(role="user", content="Hello! Can you hear me?")
]
response = llm.chat(messages)
print(response.message.content)
```

> **Important**: 
> - Cohere deprecated the `generate` API and old model names on September 15, 2025
> - Use `llm.chat()` instead of `llm.complete()` 
> - Use versioned model names (not old names)
> - **Model Choice for RAG** (ranked by RAG performance):
>   - 🥇 **`command-a-03-2025`**: **BEST FOR RAG** - 256K context, explicitly excels at RAG, 150% higher throughput, 8K output
>   - 🥈 **`command-a-reasoning-08-2025`**: Best for complex RAG - 256K context, 32K output (largest), great for multi-step reasoning
>   - 🥉 **`command-r-plus-08-2024`**: Proven RAG-optimized - 128K context, specifically designed for RAG
>   - ⚡ **`command-r7b-12-2024`**: Fast & efficient - 128K context, excels at RAG, smaller/faster
>   - 💰 **`command-r-08-2024`**: Budget option - 128K context, faster/cheaper
> - Always use `.env` file for API keys, never hardcode them

### Alternative: Generic Pattern

If you choose a different provider, the installation and usage pattern is similar:

```bash
pip install llama-index-llms-<provider-name>
```

```python
from llama_index.llms.<provider-name> import ProviderLLMClass

llm = ProviderLLMClass(api_key=your_api_key, model="model-name")
```

## Why We Use Cohere in This Course

**Cohere is our recommended choice** for several reasons:

1. **Free tier available**: No credit card required to get started. Sign up with GitHub, Google, or email.
2. **Excellent for RAG**: 
   - **🥇 Command A (`command-a-03-2025`)**: **BEST FOR RAG** - 256K context, explicitly excels at RAG, 150% higher throughput, 8K output tokens
   - **🥈 Command A Reasoning (`command-a-reasoning-08-2025`)**: Best for complex RAG - 256K context, 32K output (largest), great for multi-step reasoning
   - **🥉 Command R+ (`command-r-plus-08-2024`)**: Proven RAG-optimized - 128K context, specifically designed for RAG
   - **⚡ Command R7B (`command-r7b-12-2024`)**: Fast & efficient - 128K context, excels at RAG, smaller/faster
   - **💰 Command R (`command-r-08-2024`)**: Budget option - 128K context, faster/cheaper
3. **Quality embeddings**: Cohere's embedding models (`embed-english-v3.0`, `embed-multilingual-v3.0`) are top-tier for semantic search.
4. **Easy integration**: Simple API and well-documented LlamaIndex integration.

### Getting Your Cohere API Key

1. Sign up at [https://cohere.com](https://cohere.com) (free account)
2. Navigate to [API Keys](https://dashboard.cohere.com/api-keys)
3. Create a new API key
4. Store it securely in your `.env` file as `CO_API_KEY=your-key-here`

### For RAG Evaluation: OpenAI

We'll use OpenAI for evaluation tasks because it's faster and easier for comparison purposes. You can get an OpenAI API key from [platform.openai.com](https://platform.openai.com/api-keys). 
---

# But in the "real world," choosing the right large language model (LLM) and embeddings provider for your project requires careful consideration of several factors. 

Here are just a few points to help guide your decision:

## 🎯 Identify your business objectives and use cases

* Understand your business's present and future objectives and ensure your chosen LLM can fulfill those needs.

* Determine the LLM's specific use case, such as content generation, sentiment analysis, customer support, or fraud detection.

## 🔍 Evaluate popular LLMs and their capabilities

* Each model has unique strengths and weaknesses.

* Familiarize yourself with as many LLMs as you possibly can. Test them for accuracy, relevance and quality of generated text. Even the best LLMs may sometimes provide inaccurate information, so aim to find one that does so less frequently.

* Understand each model's strengths and weaknesses, such as advanced coding, complex reasoning, commonsense reasoning, or efficiency in building AI assistants.

* Consider the input size the LLM can handle. Larger context windows allow more input and context to be passed to the model.

## 🪪 License

* Different providers may have varying restrictions on how their models can be used. 

* Some licenses may limit the use of the LLM or embeddings to non-commercial applications, require attribution, or restrict the types of applications for which the model can be used. 

* Make sure you inspect the license and ensure that your project complies with the terms.

## 🌐 Consider language support and multilingual capabilities

* If your project requires support for multiple languages, ensure the LLM and embedding provider you choose can handle the languages you need.

* Evaluate the quality of the model's output in each language and its ability to understand and generate text in a culturally appropriate manner.

## 🔒 Evaluate security and privacy compliance

* Assess the security measures in place to protect your data and the privacy of your users.

* Look for features like data encryption, secure data handling, and compliance with relevant privacy regulations (e.g., GDPR, HIPAA).

## 💰⚡ Assess cost and performance

* Understand the cost structure of each LLM, including any usage-based pricing.

* Evaluate the performance of different models in terms of accuracy, speed, and response times.

## 🔮🛠️ Ensure long-term relevance and support

* Investigate the LLM provider's future plans and how regularly the model receives updates.

* Consider the vendor's reputation, the LLM's ability to seamlessly integrate with your existing infrastructure, and its ability to scale to address your business's growing demands.

## 🧑‍🤝‍🧑 Assess community support and resources

* Look for an active community of developers and users around the LLM and embedding provider you're considering.

* A strong community can provide valuable resources, such as tutorials, forums, and open-source projects, which can help you get started and troubleshoot issues more quickly.