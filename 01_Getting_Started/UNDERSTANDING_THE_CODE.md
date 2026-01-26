# Understanding the Code: Where Everything Comes From

This guide teaches you how to find current information and understand where each piece of code comes from.

## 📚 Table of Contents

1. [Finding Current Cohere Model Names](#1-finding-current-cohere-model-names)
2. [Understanding ChatMessage](#2-understanding-chatmessage)
3. [LlamaIndex Library Structure](#3-llamaindex-library-structure)
4. [Tracing Imports Back to Packages](#4-tracing-imports-back-to-packages)
5. [How to Stay Updated](#5-how-to-stay-updated)

---

## 1. Finding Current Cohere Model Names

### Where to Look: Official Cohere Documentation

**Primary Source:** https://docs.cohere.com/docs/models

**Steps:**
1. Go to Cohere's official documentation
2. Navigate to "Models" section
3. Look for "Command" family models
4. Check for versioned model names (e.g., `command-r-plus-08-2024`)

### Alternative Sources:

**Cohere Changelog:** https://docs.cohere.com/changelog
- Shows when models were deprecated/added
- Example: "command-r-plus was removed on September 15, 2025"

**Cohere API Reference:** https://docs.cohere.com/reference/chat
- Lists available models in API documentation
- Shows model parameters and usage

**Cohere Dashboard:** https://dashboard.cohere.com
- When you create an API key, shows available models
- Often has the most up-to-date list

### Example Search Strategy:

```bash
# Search terms to use:
- "Cohere models list 2026"
- "Cohere command-r-plus replacement"
- "Cohere available models API"
- "Cohere model deprecation"
```

### Why Model Names Change:

- **Versioning**: Models get updated (e.g., `command-r-plus` → `command-r-plus-08-2024`)
- **Deprecation**: Old models are removed to maintain quality
- **New Releases**: Better models replace older ones

---

## 2. Understanding ChatMessage

### Where ChatMessage Comes From

**LlamaIndex Core Library:** `llama-index-core`

**Documentation:** https://docs.llamaindex.ai/en/stable/api_reference/llms/

**Source Code Location:**
```python
from llama_index.core.llms import ChatMessage
```

This is part of the **core** LlamaIndex package, not a provider-specific integration.

### What is ChatMessage?

`ChatMessage` is a **data class** that represents a single message in a conversation:

```python
ChatMessage(
    role="user",        # Who sent the message: "user", "assistant", or "system"
    content="Hello!"    # The actual message text
)
```

### Why Use ChatMessage Instead of Strings?

1. **Structured Data**: Keeps role and content separate
2. **Multi-turn Conversations**: Easy to build conversation history
3. **Provider Compatibility**: Works across different LLM providers
4. **Type Safety**: Python can validate the structure

### Finding ChatMessage Examples:

**LlamaIndex Documentation:**
- https://docs.llamaindex.ai/en/stable/examples/llm/cohere/
- Search for "ChatMessage" in examples

**GitHub Examples:**
- https://github.com/run-llama/llama_index/tree/main/docs/examples
- Look for chat examples

**Python Help:**
```python
from llama_index.core.llms import ChatMessage
help(ChatMessage)  # Shows all parameters and methods
```

---

## 3. LlamaIndex Library Structure

### How LlamaIndex is Organized

LlamaIndex uses a **modular architecture**:

```
llama-index (main package)
├── llama-index-core (core functionality)
├── llama-index-llms-cohere (Cohere integration)
├── llama-index-llms-openai (OpenAI integration)
├── llama-index-embeddings-cohere (Cohere embeddings)
├── llama-index-vector-stores-qdrant (Qdrant integration)
└── ... (many more integrations)
```

### Understanding the Imports

```python
# 1. Core LLM functionality (base classes, ChatMessage, etc.)
from llama_index.core.llms import ChatMessage
#    └─ Package: llama-index-core
#    └─ Installed via: pip install llama-index==0.14.13

# 2. Cohere LLM integration (specific implementation)
from llama_index.llms.cohere import Cohere
#    └─ Package: llama-index-llms-cohere
#    └─ Installed via: pip install llama-index-llms-cohere

# 3. Cohere Embeddings integration
from llama_index.embeddings.cohere import CohereEmbedding
#    └─ Package: llama-index-embeddings-cohere
#    └─ Installed via: pip install llama-index-embeddings-cohere
```

### Why This Structure?

1. **Modularity**: Install only what you need
2. **Maintainability**: Each provider is separate
3. **Flexibility**: Easy to add new providers
4. **Size**: Smaller installs (don't need all providers)

---

## 4. Tracing Imports Back to Packages

### How to Find Where an Import Comes From

#### Method 1: Check Installed Packages

```python
# In Python/Jupyter:
import sys
import pkg_resources

# List all installed packages
installed_packages = [d for d in pkg_resources.working_set]
for package in installed_packages:
    if 'llama' in package.project_name.lower():
        print(f"{package.project_name}=={package.version}")
```

#### Method 2: Use `pip show`

```bash
# In terminal:
pip show llama-index-llms-cohere
# Shows: Name, Version, Location, Requires, etc.

pip show llama-index-core
# Shows core package details
```

#### Method 3: Check Package Location

```python
# In Python:
import llama_index.llms.cohere
print(llama_index.llms.cohere.__file__)
# Shows: C:\Users\...\site-packages\llama_index\llms\cohere\__init__.py

import llama_index.core.llms
print(llama_index.core.llms.__file__)
# Shows: C:\Users\...\site-packages\llama_index\core\llms\__init__.py
```

#### Method 4: Check What Was Installed

Look at your installation script (`install.sh`):

```bash
pip install llama-index==0.14.13              # Installs core + base
pip install llama-index-llms-cohere           # Installs Cohere LLM integration
pip install llama-index-embeddings-cohere     # Installs Cohere embeddings
```

### Package Dependency Chain

```
llama-index (0.14.13)
├── Installs: llama-index-core automatically
└── Provides: Base classes, ChatMessage, etc.

llama-index-llms-cohere
├── Depends on: llama-index-core
├── Depends on: cohere (SDK)
└── Provides: Cohere LLM class

llama-index-embeddings-cohere
├── Depends on: llama-index-core
├── Depends on: cohere (SDK)
└── Provides: CohereEmbedding class
```

---

## 5. How to Stay Updated

### Step-by-Step Process for Finding Current Information

#### Step 1: Check Official Documentation First

1. **Cohere Models:**
   - Go to: https://docs.cohere.com/docs/models
   - Check changelog: https://docs.cohere.com/changelog
   - Look for deprecation notices

2. **LlamaIndex:**
   - Go to: https://docs.llamaindex.ai
   - Check release notes: https://docs.llamaindex.ai/en/stable/CHANGELOG/
   - Search for provider-specific docs

#### Step 2: Check Package Versions

```bash
# Check what's installed
pip list | grep llama-index
pip list | grep cohere

# Check latest versions
pip index versions llama-index-llms-cohere
pip index versions cohere
```

#### Step 3: Test in Code

```python
# Try importing and see what's available
from llama_index.llms.cohere import Cohere
help(Cohere)  # Shows all parameters, including model options

# Check what models are supported
llm = Cohere(api_key="test")
# Look at error messages or documentation strings
```

#### Step 4: Check GitHub

- **LlamaIndex:** https://github.com/run-llama/llama_index
- **Cohere Python SDK:** https://github.com/cohere-ai/cohere-python
- Look at recent commits, issues, and releases

#### Step 5: Use Web Search Strategically

**Good Search Queries:**
```
"Cohere models 2026"
"LlamaIndex Cohere integration example"
"command-r-plus replacement"
"llama-index-llms-cohere latest version"
```

**Bad Search Queries:**
```
"cohere" (too broad)
"llm" (too generic)
```

---

## 6. Practical Exercise: Finding Current Info

### Exercise 1: Find Current Cohere Models

1. Visit: https://docs.cohere.com/docs/models
2. List all available Command models
3. Note which ones are deprecated
4. Find the recommended model for RAG

### Exercise 2: Understand ChatMessage

1. Run: `help(ChatMessage)` in Python
2. Read: https://docs.llamaindex.ai/en/stable/api_reference/llms/
3. Try creating different message types:
   ```python
   ChatMessage(role="system", content="You are a helpful assistant")
   ChatMessage(role="user", content="Hello")
   ChatMessage(role="assistant", content="Hi there!")
   ```

### Exercise 3: Trace Your Imports

1. Run: `pip show llama-index-llms-cohere`
2. Check: Where is it installed? (`pip show` shows Location)
3. Inspect: Look at the source code in that location
4. Understand: What does the package provide?

---

## 7. Quick Reference: Where to Find Things

| What You Need | Where to Look |
|--------------|---------------|
| Cohere model names | https://docs.cohere.com/docs/models |
| Cohere API changes | https://docs.cohere.com/changelog |
| ChatMessage docs | https://docs.llamaindex.ai/en/stable/api_reference/llms/ |
| LlamaIndex examples | https://docs.llamaindex.ai/en/stable/examples/ |
| Package versions | `pip list` or PyPI.org |
| Installation info | Your `install.sh` or `requirements.txt` |
| Source code | GitHub.com (run-llama/llama_index) |

---

## 8. Key Takeaways

1. **Always check official docs first** - They're the source of truth
2. **Model names change** - Check changelogs for deprecations
3. **LlamaIndex is modular** - Each provider is a separate package
4. **Use `pip show` and `help()`** - They reveal package details
5. **Stay updated** - Check docs regularly, especially after errors

---

## 9. Your Code Breakdown

```python
# ============================================
# PACKAGE: llama-index-core
# INSTALLED VIA: pip install llama-index==0.14.13
# DOCS: https://docs.llamaindex.ai/en/stable/api_reference/llms/
# ============================================
from llama_index.core.llms import ChatMessage

# ============================================
# PACKAGE: llama-index-llms-cohere
# INSTALLED VIA: pip install llama-index-llms-cohere
# DOCS: https://docs.llamaindex.ai/en/stable/examples/llm/cohere/
# ============================================
from llama_index.llms.cohere import Cohere

# ============================================
# PACKAGE: llama-index-embeddings-cohere
# INSTALLED VIA: pip install llama-index-embeddings-cohere
# DOCS: https://docs.llamaindex.ai/en/stable/api_reference/embeddings/cohere/
# ============================================
from llama_index.embeddings.cohere import CohereEmbedding

# ============================================
# MODEL NAME: Found at https://docs.cohere.com/docs/models
# Current Options:
# - command-a-03-2025 (latest, 256K context, strongest overall)
# - command-r-plus-08-2024 (RAG-optimized, 128K context)
# ============================================
llm = Cohere(
    api_key=os.getenv("CO_API_KEY"),
    model="command-a-03-2025"  # ← Check Cohere docs for current names
)

# ============================================
# ChatMessage: Part of llama-index-core
# Used for structured conversation format
# ============================================
messages = [
    ChatMessage(role="user", content="Hello!")
]
```

---

## Next Steps

1. Bookmark the official documentation links
2. Set up alerts for Cohere and LlamaIndex releases
3. Practice tracing imports in your own code
4. Build a habit of checking docs before asking questions

Remember: **The best way to learn is to explore the documentation yourself!**
