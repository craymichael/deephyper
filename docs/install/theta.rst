Theta (ALCF)
************

`Theta <https://www.alcf.anl.gov/theta>`_ is a 11.69 petaflops system based on the second-generation Intel Xeon Phi processor at Argonne Leadership Computing Facility (ALCF).
It serves as a stepping stone to the ALCF's next leadership-class supercomputer, Aurora.
Theta is a massively parallel, many-core system based on Intel processors and interconnect technology, a new memory search_space,
and a Lustre-based parallel file system, all integrated by Cray’s HPC software stack.

.. _theta-user-installation:

User installation
=================

Before installating DeepHyper, go to your project folder::

    cd /lus/theta-fs0/projects/PROJECTNAME
    mkdir theta && cd theta/

DeepHyper can be installed on Theta by following these commands::

    git clone https://github.com/deephyper/deephyper.git --depth 1
    ./deephyper/install/theta.sh

Then, restart your session.

.. warning::
    You will note that a new file ``~/.bashrc_theta`` was created and sourced in the ``~/.bashrc``. This is to avoid conflicting installations between the different systems available at the ALCF.

.. note::
    To test your installation run::

        ./deephyper/tests/system/test_theta.sh


A manual installation can also be performed with the following set of commands::

    module load postgresql
    module load miniconda-3
    conda create -p dh-theta python=3.8 -y
    conda activate dh-theta/
    conda install gxx_linux-64 gcc_linux-64 -y
    # DeepHyper + Analytics Tools (Parsing logs, Plots, Notebooks)
    pip install deephyper[analytics,balsam]
    conda install tensorflow -c intel -y




.. note::
    Horovod can be installed to use data-parallelism during the evaluations of DeepHyper. To do so use ``pip install deephyper[analytics,hvd,balsam]`` while or after installing.


Analytics
---------

Follow the installation like :ref:`analytics-local-install` to create a new IPython kernel.
Then go to `Theta Jupyter <https://jupyter.alcf.anl.gov/theta>`_ and use
your regular authentication method. The `Jupyter Hub tutorial <https://www.alcf.anl.gov/user-guides/jupyter-hub>`_
from Argonne Leadership Computing Facility might help you in case of troubles.

.. WARNING::

    Now when openning a generated notebook make sure to use the *"Python (deephyper)"* kernel before executing otherwise you will not have all required dependencies.


Developer installation
======================

1. Load the miniconda module::

    module load miniconda-3

.. note::
    The miniconda module is using the `Intel channel <https://software.intel.com/en-us/articles/using-intel-distribution-for-python-with-anaconda>`_ which has optimized wheels using MKL/DNN (available on KNL nodes with Xeon Phi CPU) for some packages.

2. Create a virtual environment for your deephyper installation as a developer::

    conda create -p dh-env --clone base

3. Activate this freshly created virtual environment::

    conda activate dh-env

4. Clone the deephyper repo::

    git clone https://github.com/deephyper/deephyper.git deephyper_repo/

5. Go to the root directory of the repo::

    cd deephyper_repo/


6. Switch to the develop branch::

    git checkout develop

7. Install the package (with analytics support)::

    pip install -e .['analytics']


8. Install an ipython kernel for analytics support::

    pip install ipykernel

    python -m ipykernel install --user --name deephyper-dev-env --display-name "Python deephyper-dev-env"

