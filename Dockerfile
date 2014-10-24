FROM jupyter/demo

MAINTAINER IPython Project <ipython-dev@scipy.org>

USER root

RUN pip2 install ipython[all] --force-reinstall --upgrade
RUN pip3 install ipython[all] --force-reinstall --upgrade

RUN pip2 install https://github.com/ellisonbg/leafletwidget/archive/b03ddea2842b6939810b82ee93aa13e28d458456.zip
RUN pip3 install https://github.com/ellisonbg/leafletwidget/archive/b03ddea2842b6939810b82ee93aa13e28d458456.zip

ADD HMDA.ipynb /home/jupyter/HMDA.ipynb
ADD gz_2010_us_050_00_5m.json /home/jupyter/gz_2010_us_050_00_5m.json
RUN chown jupyter:jupyter . -R

USER jupyter

CMD ipython2 notebook --no-browser --port 8888 --ip=0.0.0.0 --NotebookApp.base_url=/$RAND_BASE --NotebookApp.tornado_settings="{'template_path':['/srv/ga/', '/srv/ipython/IPython/html', '/srv/ipython/IPython/html/templates']}"
