# Salon Utility: Mint Resource

This is a utility to be used with [salon](https://github.com/NYULibraries/salon) permalink resolver. Generates and reserves an empty persistent link.

## Setup

Salon authenticates using a token-based NYU Libraries OAuth at https://login.library.nyu.edu. Application IDs can be found at: https://login.library.nyu.edu/oauth/applications.

In order to pass Salon's authentication, an application ID and its corresponding secret must be provided to the scripts environment. Run the following code, replacing the values in braces with your personal, *secret* login application values.

```sh
touch .env
echo "SALON_CLIENT_ID={APP_ID}" >> .env
echo "SALON_CLIENT_SECRET={APP_SECRET}" >> .env
```

Then, add executable permissions to the script with:

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
# OUTPUT:
r3rj2r68

# Fetch for multiple resources
./salon-mint-resource.sh 5
## OUTPUT:
g8sbjjv0
xd0rl1fy
86a61cn0
4x4y9ei3
f30mhqvq
```
