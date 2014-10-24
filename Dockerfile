FROM jupyter/demo

MAINTAINER IPython Project <ipython-dev@scipy.org>

USER root

RUN pip install https://github.com/ellisonbg/leafletwidget/archive/939e7bea2dff26a8899a8bb9528d576b353452ee.zip
RUN pip3 install https://github.com/ellisonbg/leafletwidget/archive/939e7bea2dff26a8899a8bb9528d576b353452ee.zip

USER jupyter

