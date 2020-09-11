FROM jupyter/scipy-notebook:ea01ec4d9f57

LABEL maintainer="Mark Dean <mdean@bnl.gov>"

# Packages available via conda
RUN conda install --quiet --yes \
    fisx=1.1.* \
    lmfit=1.0.* \
    phonopy=2.6.* \
    pybroom=0.2 \
    pyfai=0.19.* \
    pymatgen=2020.7.* \
    PyOpenGL=3.1.* \
    seekpath=1.9.* \
    xrayutilities=1.6.*

# pymcaspec needs mesa-common-dev
USER root
RUN apt update
RUN apt-get install -y mesa-common-dev
USER $NB_UID
RUN pip install 'pymca==5.5.*'


# Our packages are installed based on tagged git versions
RUN pip install \
  git+git://github.com/scikit-beam/scikit-beam.git@v0.0.22 \
  git+git://github.com/mpmdean/h5file.git@v0.1 \
  git+git://github.com/mpmdean/pymcaspec.git@v0.1 \
  git+git://github.com/mpmdean/fitting_functions@6c094eac3d4cd95419c498d84ea7253363db8b95
