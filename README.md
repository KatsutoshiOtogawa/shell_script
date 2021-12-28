# shell_script

## How to use

```bash

# directory create and copy files.
mkdir ~/functions
cp functions/* ~/functions/

# add functions 
echo '# load functions' >> ~/.bash_profile
echo ~/functions/* | xargs -n 1 -I {} echo source {} >> ~/.bash_profile
```
