# Fun Scripts

Scripts that do things!

<details>
<summary>run_hugo</summary>

> &nbsp;
> When placed inside a Hugo project & run this script:
> * Sets up a TMUX environment (two windows, one named "Hugo")
> * Runs [this dockerfile](https://github.com/probablySophie/dockerfiles/blob/main/alpine_hugo.dockerfile) (must be named `alpine/hugo`)
> * Waits 2 seconds, and then runs Hugo with drafts enabled!

</details>

<details>
<summary>remove_background.sh</summary>  

> &nbsp;  
> Pulls everything required to create a docker image that:  
> * Runs a local web server
> * Takes an input image
> * Attempts to remove the background using [rembg](https://github.com/danielgatis/rembg)
> * Auto-downloads the output
</details>

<details>
<summary>microos_setup.sh</summary>

> &nbsp;  
> A setup script for a fresh [MicroOS]([url](https://microos.opensuse.org/)) install.  
> * Installs tmux  
> * Installs [Portainer](https://www.portainer.io/)
> * Creates a systemd service to auto-run Portainer
> * Enables that service
> * Creates an alias where the docker socket should be that points to the portainer socket
> ![300](https://media1.tenor.com/m/eqLNYv0A9TQAAAAC/swap-indiana-jones.gif)
</details>
