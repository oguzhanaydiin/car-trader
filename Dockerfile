# Stage 1: Install dependencies and build the application
FROM oven/bun:latest AS build

# Set the working directory inside the container
WORKDIR /app

# Copy over the package.json, bun.lockb, and other necessary config files
COPY package.json bun.lockb* ./

# Install dependencies using bun
RUN bun install

# Copy the rest of the app source code
COPY . .

# Build the Nuxt application for production
RUN bun run build

# Stage 2: Production environment
FROM oven/bun:latest

# Set the working directory inside the container
WORKDIR /app

# Copy built files from the build stage
COPY --from=build /app ./

# Expose the necessary port for Nuxt (3000 by default)
EXPOSE 3000

# Run the Nuxt production server
CMD ["bun", "run", "preview"]
