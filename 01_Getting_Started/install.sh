#!/bin/bash

# Updated: January 2026
# This script installs all dependencies for the LlamaIndex RAG course
# All package versions have been updated from the original 2024 versions

# Check if Conda is installed
if ! command -v conda &> /dev/null
then
    echo "Conda could not be found. Please install Conda first from the official Anaconda website: https://www.anaconda.com/products/individual"
    exit
fi

# Create a new Conda environment
# Updated: Using Python 3.12 (recommended) - can also use 3.11 or 3.10
# Note: Qdrant 1.16.2 requires Python >=3.10
echo "Creating new Conda environment named 'lil_llama_index' with Python 3.12 and python-dotenv..."
conda create --name lil_llama_index python=3.12 python-dotenv -y

# Activate the Conda environment
echo "Activating the 'lil_llama_index' environment..."
source $(conda info --base)/etc/profile.d/conda.sh
conda activate lil_llama_index

# Install Jupyter and JupyterLab
# IMPORTANT: jupyterlab_widgets 3.0.16 has a known extraction bug on Windows
# We pin to 3.0.15 which works correctly
echo "Installing Jupyter and JupyterLab..."
echo "Note: Pinning jupyterlab_widgets to 3.0.15 to avoid Windows extraction bug in 3.0.16"
conda install ipykernel jupyter jupyterlab jupyterlab_widgets=3.0.15 -y

# Verify JupyterLab installation
echo "Verifying JupyterLab installation..."
jupyter lab --version

# Install LlamaIndex
# Updated: 0.10.37 (2024) -> 0.14.13 (Jan 2026)
echo "Installing LlamaIndex..."
pip install llama-index==0.14.13

# Install Qdrant client
# Updated: 1.9.1 (2024) -> 1.16.2 (Dec 2025)
# Note: Requires Python >=3.10
echo "Installing Qdrant client..."
pip install qdrant-client==1.16.2

# Install LlamaIndex dependencies for Qdrant
# Updated: 0.2.8 -> 0.9.1 (Jan 2026)
echo "Installing LlamaIndex dependencies for Qdrant..."
pip install llama-index-vector-stores-qdrant==0.9.1
pip install llama-index-readers-file

# Install LLM Libraries
# Updated: All packages updated to latest versions (Jan 2026)
echo "Installing LLM Libraries..."

# Core SDKs
echo "Installing core SDKs (Cohere and OpenAI)..."
pip install cohere==5.20.2
pip install openai==2.15.0

# LlamaIndex LLM integrations
echo "Installing LlamaIndex LLM integrations..."
pip install llama-index-llms-openai==0.6.13
pip install llama-index-llms-cohere

# LlamaIndex Embeddings integrations
echo "Installing LlamaIndex Embeddings integrations..."
pip install llama-index-embeddings-cohere==0.6.1
pip install llama-index-embeddings-openai

# LlamaIndex Post-processor for Cohere reranking
echo "Installing LlamaIndex post-processors..."
pip install llama-index-postprocessor-cohere-rerank

# Link IPython kernel to Conda Environment
echo "Linking IPython kernel to Conda environment..."
python -m ipykernel install --user --name=lil_llama_index --display-name "LlamaIndex (LinkedIn Learning)"

echo ""
echo "=========================================="
echo "Setup complete!"
echo "=========================================="
echo "You can now start JupyterLab with: jupyter lab"
echo ""
echo "Package versions installed:"
echo "  - Python: 3.12"
echo "  - LlamaIndex: 0.14.13"
echo "  - Qdrant client: 1.16.2"
echo "  - OpenAI SDK: 2.15.0"
echo "  - Cohere SDK: 5.20.2"
echo "  - jupyterlab_widgets: 3.0.15 (pinned to avoid Windows bug)"
echo "=========================================="
