# Salon Utility: Mint Resource

Generates and reserves an empty persistent link via the [salon](https://github.com/NYULibraries/salon) permalink resolver.

## Setup

1. Download and unzip the repository, and navigate to the unzipped folder in your OS environment.

2. Salon authenticates using a token-based NYU Libraries OAuth2 application at https://login.library.nyu.edu. Application IDs can be generated and viewed at: https://login.library.nyu.edu/oauth/applications.

  In order to pass Salon's authentication process, an application ID and its corresponding secret must be provided to the scripts environment. These values are read from environment variables `SALON_CLIENT_ID` and `SALON_CLIENT_SECRET`. If these environment variables are not set on your session, the application will request you to provide them through the terminal.

  Alternatively, you can place your variables in a `.env` file which is read before the program executes. To generate a `.env` file, run the following code in your terminal/shell, replacing the values in braces with your personal, *secret* login application values.

  **Note**: Application IDs/secrets should **never** be shared on a publicly accessible local machine or cloud-based service. Users have a responsibility to keep their authorization keys secret.

  ```sh
  touch .env
  echo "SALON_CLIENT_ID=\"{APP_ID}\"" >> .env
  echo "SALON_CLIENT_SECRET=\"{APP_SECRET}\"" >> .env
```

3. Add executable permissions to the script with:

  ```
  chmod +x salon-mint-resource.sh
  ```

## Usage

Run the script. The script's first argument is an optional argument for requesting multiple resource reservations. A single reservation is requested if no argument is provided.

```sh
./salon-mint-resource.sh {NUMBER_OF_RESOURCES}
```

### Example

```sh
# Fetch for a single resource
./salon-mint-resource.sh
# EXAMPLE OUTPUT:
r3rj2r68

# Fetch for multiple resources
./salon-mint-resource.sh 5
# EXAMPLE OUTPUT:
g8sbjjv0
xd0rl1fy
86a61cn0
4x4y9ei3
f30mhqvq
```
