# NEXUS - Pro eSports Team Landing Page

## Group Information
- **Student 1:** [Full Name] - [Student ID] - Role: DevOps Engineer
- **Student 2:** [Full Name] - [Student ID] - Role: Full-Stack Developer
- **Student 3:** [Full Name] - [Student ID] - Role: Frontend Developer

## Project Description
A premium gaming hub landing page for NEXUS eSports, featuring a modern dark theme with glassmorphism, responsive design, and smooth animations.

## Live Deployment
🚀 **Live URL:** [Your deployed application URL]

## Technologies Used
- HTML5, CSS3, JavaScript
- Font Awesome
- Google Fonts (Orbitron, Rajdhani)
- GitHub Actions
- Vercel (Deployment)

## Features
- Hero section with interactive grid animation.
- About section with glassmorphism cards.
- Active roster display (10 elements removed as per request).
- Match schedule table.
- Responsive navigation and mobile menu.
- Scroll-to-top functionality.

## Branch Strategy
We implemented the following branching strategy:
- `main` - Production branch
- `develop` - Integration branch
- `feature/*` - Feature development branches

## Individual Contributions

### [Student 1 Name]
- Repository setup and configuration
- GitHub Actions CI/CD pipeline implementation (ci.yml and deploy.yml)
- Deployment setup and management
- removed legacy social icons from roster

### [Student 2 Name]
- Developed core UI features and components
- Implemented responsive design across all sections
- Managed feature branches for integration

### [Student 3 Name]
- README.md creation and maintenance
- User documentation and styling refinements
- Integration of frontend assets

## Setup Instructions

### Prerequisites
- Node.js (version 18 or higher)
- Git

### Installation
```bash
# Clone the repository
git clone https://github.com/[username]/Gaming-page.git

# Navigate to project directory
cd Gaming-page/Gaming-Page

# Install dependencies
npm install

# Run development server
npm run start
```

## Docker Containerization

This application is fully containerized using Docker, allowing for consistent deployment across any environment. The implementation uses a multi-stage build process to ensure the final image is highly optimized, secure, and production-ready.

### Prerequisites for Docker
- Docker Engine installed
- Docker Compose installed

### Building and Running the Container

**Option 1: Using Docker Compose (Recommended)**
This is the easiest way to launch the complete application stack, including isolated custom networking and resource limits.

```bash
# Build and start the container in detached mode
docker-compose up -d --build

# To stop and remove the container
docker-compose down
```

**Option 2: Using standard Docker commands**
```bash
# Build the Docker image
docker build -t nexus-esports-landing .

# Run the container (maps port 8080 on your host to 8080 in the container)
docker run -d -p 8080:8080 --name nexus_frontend nexus-esports-landing
```

### Configuration Options

The container can be configured using environment variables. When using `docker-compose`, you can set these in a `.env` file or pass them inline:

| Environment Variable | Default | Description |
|----------------------|---------|-------------|
| `HOST_PORT` | `8080` | The port exposed on the host machine |
| `NODE_ENV` | `production` | Node environment indicating production deployment |

Example setting a custom port:
```bash
HOST_PORT=3000 docker-compose up -d
```

### Security Considerations
- The container runs as a non-root user (`nginx`, UID 101) to adhere to the principle of least privilege.
- Multi-stage builds are used so that build tools (Node.js) are not included in the final runtime image.
- Distroless/Alpine base images provide a minimal attack surface.

## Deployment Process
Our CI/CD pipeline is managed via GitHub Actions:
1. **CI Pipeline:** Runs on every push to `main`, `develop`, or `feature/*` branches. It handles dependency installation, linting, and building.
2. **Deploy to Production:** Automatically triggers on merge to the `main` branch, deploying the application to Vercel.

## Build Status
![CI Pipeline](https://github.com/[username]/Gaming-page/workflows/CI%20Pipeline/badge.svg)
![Deploy](https://github.com/Lakshitha-chanka/Gaming-page/workflows/Deploy%20to%20Production/badge.svg)
