
## YOUGOV
alias upcheese='python setup.py register -r ygcheese sdist upload -r ygcheese'
alias yghammer='killall -9 postgres ; killall -9 mongod ; killall -9 python'
alias _pycleanjunk='find . -name "*.pyc" -or -name "*.orig" -or -name "*.swp" -or -name "*.swo" -or -name "*.log" -or -name "Pyro_log" -or -name "*.egg-info" | xargs rm -vRf'
alias swarm-gryphon='cagey --url https://deploy.yougov.net swarm Gryphon-'
alias swarm-gryphon-staging='cagey --url https://deploy.yougov.net swarm Gryphon-US_staging_'

export VELOCIRAPTOR_URL=https://deploy.yougov.net

function swarm() {
    if [ -z "$1" -o -z "$2" ]; then
        echo "Usage: swarm [namespace] [tag]";
    else
        cagey build $1 $2
    fi
}
