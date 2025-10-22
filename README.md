# Basic Devcontainer Template

This repository provides a minimal **Python development container setup** that can be used as a standalone environment or integrated into larger multi-container setups via `docker-compose`.

It serves as a **template** for quickly bootstrapping reproducible and isolated Python development environments.

---

## Structure
.  
├── .env.example # Example environment variables file  
├── .gitignore # Ignore cache, environment, and temp files  
├── devcontainer.json # VS Code Dev Container configuration  
├── docker-compose.yml # Docker Compose configuration for multi-container setups  
├── Dockerfile # Base container definition  
├── requirements.txt # Python dependencies (empty by default)  
└── README.md # This file



---

## Getting Started

### 1. Clone this Repository


git clone https://github.com/.../devcontainer-template.git
cd devcontainer-template

### 2. Create a .env File
cp .env.example .env  
DATA_PATH=C:\path\to\your\data  
GIT_USER_NAME="Max Mustermann"  
GIT_USER_EMAIL="max.mustermann@hs-mainz.de"  
GIT_TOKEN="your_token_here"  

💡 Note: On non-Windows systems, make sure to use Unix-style paths for DATA_PATH, e.g. /home/user/data.

### 3. Build and Start the Container

You can start the development container directly from VS Code (recommended):

 1. Open the folder in VS Code.
 2. When prompted, click “Reopen in Container”. (use ctrl+shift+p or similar key combination if it doesn't come up)
 3. VS Code will automatically build and start the container defined in devcontainer.json.

Alternatively, you can start it manually:
`docker compose up --build -d`


## Inside the Container
Once attached to the container, you’ll be in:  
`/home/devcontainer`  
Your workspace is mounted at:  
`/home/devcontainer/devcontainer-base`  
Data from your host system is available under:  
`/home/devcontainer/data`  


## License

This template is provided under the MIT License.
Feel free to modify and reuse it for your own projects.