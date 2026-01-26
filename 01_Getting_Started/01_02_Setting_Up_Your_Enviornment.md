# Setting up your environment!

> **📅 Update Note (January 2026)**: This guide has been updated from the original 2024 version. Outdated package versions are marked with `⚠️ OUTDATED` comments, and current recommendations are provided with `✅ CURRENT RECOMMENDATION`. The core setup process remains the same, but all package versions have been updated to work with LlamaIndex 0.14.13 and current SDKs.

We'll be using `Conda` as our package manager. If you have a preference for `venv` or `poetry`, feel free to use those.

Conda is a package manager that helps manage different software environments. If you're following along on Codespaces, then it's already installed for you! If you're following along locally and you haven't already installed `Conda` then head over official [Anaconda website](https://www.anaconda.com/products/individual) for instructions on how to to download and install Conda.

# Create a new Conda environment

Open your terminal or command prompt and run the following command to create a new Conda environment named `lil_llama_index`, and install Python 3.10.

<!-- ⚠️ OUTDATED: Python 3.10 is still supported but consider Python 3.11 or 3.12 for better performance -->
<!-- ✅ CURRENT RECOMMENDATION: Python 3.11 or 3.12 (LlamaIndex 0.14 requires Python >=3.9, <4.0) -->
```
conda create --name lil_llama_index python==3.10 python-dotenv
```

<!-- Alternative with Python 3.11 (recommended for 2026): -->
<!-- conda create --name lil_llama_index python==3.11 python-dotenv -->

### Activate the Conda environment

Once the environment is created, activate it using the following command:

```
conda activate lil_llama_index
```

### Install Jupyter and JupyterLab

Jupyter is a popular interactive computing platform, and JupyterLab is its next-generation user interface. You can install both using the following command:

```
conda install ipykernel jupyter jupyterlab
```

##### Verify the installation

This will open JupyterLab in your default web browser, allowing you to create and run Jupyter notebooks.

```
jupyter lab
```

# Installing 🗂️ LlamaIndex 🦙

LlamaIndex is nicely seperated into numerous smaller packages. 

For now, let's just install the starter package. As we progress along the course I will add additional libraries as needed with `pip install ...` in the first cell of every notebook.

<!-- ⚠️ OUTDATED: Version 0.10.37 is from 2024, ~4 major versions behind -->
<!-- ✅ CURRENT RECOMMENDATION: llama-index==0.14.13 (released Jan 21, 2026) -->
```python
# OLD (Outdated - 2024):
# pip install llama-index==0.10.37

# NEW (Current - 2026):
pip install llama-index==0.14.13
```

<!-- Note: LlamaIndex is a rapidly evolving library. While the course was built with 0.10.37, -->
<!-- we're updating to 0.14.13 to use the latest features and fixes. Some API changes may occur, -->
<!-- but the core concepts remain the same. If you encounter issues, we'll update the code as we go. -->

# Install Qdrant

We'll make use of Qdrant as our vector database through this course. Let's install the dependencies for that.

<!-- ⚠️ OUTDATED: qdrant-client==1.9.1 is from 2024 -->
<!-- ✅ CURRENT RECOMMENDATION: qdrant-client==1.16.2 (released Dec 12, 2025) -->
<!-- Note: Version 1.16.2 requires Python >=3.10 and dropped support for Python 3.9 -->
```python
# OLD (Outdated - 2024):
# pip install qdrant-client==1.9.1

# NEW (Current - 2026):
pip install qdrant-client==1.16.2
```

<!-- Note: Qdrant client has had significant updates. Version 1.16.2 includes bug fixes and -->
<!-- improved performance. Make sure you're using Python 3.10+ for compatibility. -->

### Installing LlamaIndex dependencies for Qdrant

LlamaIndex has it's dependencies nicely seperated out. Let's install what we need for Qdrant:

<!-- ⚠️ OUTDATED: Both packages are significantly outdated -->
<!-- ✅ CURRENT RECOMMENDATION: -->
<!--   - llama-index-vector-stores-qdrant==0.9.1 (released Jan 13, 2026) -->
<!--   - llama-index-readers-file: Check latest version (package structure may have changed) -->
```python
# OLD (Outdated - 2024):
# pip install llama-index-vector-stores-qdrant==0.2.8 llama-index-readers-file==0.1.22

# NEW (Current - 2026):
pip install llama-index-vector-stores-qdrant==0.9.1
pip install llama-index-readers-file
# Note: For readers-file, install latest version (check with: pip install llama-index-readers-file --upgrade)
```

<!-- Note: The Qdrant integration has been significantly updated with new features like -->
<!-- payload indexes, hybrid search, and improved performance. The readers-file package -->
<!-- is now part of the core bundle, but can still be installed separately if needed. -->

# Install LLM Libraries

We'll conistently make use of Cohere and OpenAI throughout the course, so let's install those dependencies as well.

<!-- ⚠️ OUTDATED: All packages are significantly outdated (from 2024) -->
<!-- ✅ CURRENT RECOMMENDATIONS (2026): -->
<!--   - cohere==5.20.2 (released Dec 18, 2025) -->
<!--   - openai==2.15.0 (released Jan 9, 2026) -->
<!--   - llama-index-llms-cohere: Check latest version -->
<!--   - llama-index-llms-openai==0.6.13 (released Jan 13, 2026) -->
<!--   - llama-index-embeddings-cohere==0.6.1 (released Sep 8, 2025) -->
<!--   - llama-index-embeddings-openai: Check latest version -->
<!--   - llama-index-postprocessor-cohere-rerank: Check latest version -->
```python
# OLD (Outdated - 2024):
# pip install cohere==5.5.0 
# pip install openai==1.30.1
# pip install llama-index-llms-cohere==0.2.0 
# pip install llama-index-llms-openai==0.1.19
# pip install llama-index-embeddings-cohere==0.1.8
# pip install llama-index-embeddings-openai==0.1.9
# pip install llama-index-postprocessor-cohere-rerank==0.1.6

# NEW (Current - 2026):
# Core SDKs
pip install cohere==5.20.2
pip install openai==2.15.0

# LlamaIndex LLM integrations
pip install llama-index-llms-openai==0.6.13
pip install llama-index-llms-cohere
# Note: For llama-index-llms-cohere, install latest: pip install llama-index-llms-cohere --upgrade

# LlamaIndex Embeddings integrations
pip install llama-index-embeddings-cohere==0.6.1
pip install llama-index-embeddings-openai
# Note: For llama-index-embeddings-openai, install latest: pip install llama-index-embeddings-openai --upgrade

# LlamaIndex Post-processor for Cohere reranking
pip install llama-index-postprocessor-cohere-rerank
# Note: Install latest version: pip install llama-index-postprocessor-cohere-rerank --upgrade
```

<!-- Important Notes: -->
<!-- 1. OpenAI SDK 2.x has breaking changes from 1.x - API usage may differ -->
<!-- 2. Cohere SDK 5.20.2 includes fixes for deprecated rerank v2 (now uses rerank v3.5) -->
<!-- 3. LlamaIndex integration packages have been significantly updated -->
<!-- 4. Some packages may need latest versions - use --upgrade flag or check PyPI -->

# Link IPython kernel to Conda Enviornment

```python
python -m ipykernel install --user --name=lil_llama_index --display-name "LlamaIndex (LinkedIn Learning)"
```

# Automate the setup

PS: To make it easy on you if you have to terminate your codespace and start from scratch, I created a bash script you can run. It's in this directory and is `install.sh`.

To run this script:

- Make the script executable: `chmod +x install.sh`

- Run the script: `./install.sh`