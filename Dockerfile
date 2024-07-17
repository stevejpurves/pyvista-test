FROM jupyter/base-notebook:python-3.10

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt
# Install vtk-osmesa wheel
RUN pip uninstall vtk -y
RUN pip install --no-cache-dir --extra-index-url https://wheels.vtk.org vtk-osmesa

WORKDIR $HOME

# allow jupyterlab for ipyvtk
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'