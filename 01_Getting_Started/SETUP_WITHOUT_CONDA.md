# Setting Up Environment Without Conda (Using venv)

Since Conda is not installed, we'll use Python's built-in `venv` module instead. This works just as well for this project!

## Step 1: Create Virtual Environment

```powershell
# Navigate to your project directory (if not already there)
cd C:\Users\owais\Documents\AI\hands-on-ai-rag-using-llamaindex-3830207

# Create virtual environment
python -m venv venv
```

This creates a folder called `venv` in your project directory.

## Step 2: Activate Virtual Environment

**For PowerShell:**
```powershell
.\venv\Scripts\Activate.ps1
```

**If you get an execution policy error, run this first:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Alternative (if PowerShell script doesn't work):**
```powershell
.\venv\Scripts\activate
```

You should see `(venv)` at the beginning of your prompt, indicating the environment is active.

## Step 3: Upgrade pip (Recommended)

```powershell
python -m pip install --upgrade pip
```

## Step 4: Install python-dotenv

```powershell
pip install python-dotenv
```

## Step 5: Install Jupyter and JupyterLab

```powershell
pip install ipykernel jupyter jupyterlab
```

## Step 6: Install LlamaIndex and Dependencies

Follow the installation steps from `01_02_Setting_Up_Your_Enviornment.md`, but use `pip install` commands directly (they're the same whether using Conda or venv).

## Step 7: Link IPython Kernel

```powershell
python -m ipykernel install --user --name=lil_llama_index --display-name "LlamaIndex (LinkedIn Learning)"
```

## Step 8: Verify Installation

```powershell
jupyter lab
```

---

## Notes

- **Python Version**: You have Python 3.13.0, which should work with LlamaIndex 0.14 (requires >=3.9, <4.0)
- **Activation**: Every time you open a new terminal, you'll need to activate the environment again with `.\venv\Scripts\Activate.ps1`
- **Deactivation**: Type `deactivate` when you want to exit the virtual environment
- **venv vs Conda**: Both work the same for this project. `venv` is simpler and built into Python!

---

## Quick Reference

**Activate environment:**
```powershell
.\venv\Scripts\Activate.ps1
```

**Deactivate environment:**
```powershell
deactivate
```

**Check if activated:**
Look for `(venv)` at the start of your PowerShell prompt.
