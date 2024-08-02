#!/bin/bash

pip install matplotlib
pip install plotly==5.9.0
pip install "jupyterlab>=3" "ipywidgets>=7.6" jupyter-dash
pip install "notebook>=5.3" "ipywidgets>=7.5"
pip install ipykernel
pip3 install torch==2.2.0 torchvision --index-url https://download.pytorch.org/whl/cu118
pip install torchmetrics==0.11.4
pip install pyg_lib torch_scatter torch_cluster -f https://data.pyg.org/whl/torch-2.2.0+cu118.html
pip install torch_geometric==2.3.0
pip install plyfile
pip install h5py
pip install colorhash
pip install seaborn
pip install numba
pip install pytorch-lightning
pip install pyrootutils
pip install hydra-core --upgrade
pip install hydra-colorlog
pip install hydra-submitit-launcher
pip install rich
pip install torch_tb_profiler
pip install wandb
pip install open3d
pip install gdown
pip install ipyfilechooser

echo
echo
echo "⭐ Installing FRNN"
echo
git clone --recursive https://github.com/lxxue/FRNN.git src/dependencies/FRNN

# install a prefix_sum routine first
cd src/dependencies/FRNN/external/prefix_sum
python3 setup.py install

# install FRNN
cd ../../ # back to the {FRNN} directory
python3 setup.py install
cd ../../../

echo
echo
echo "⭐ Installing Point Geometric Features"

pip install git+https://github.com/drprojects/point_geometric_features.git

echo
echo
echo "⭐ Installing Parallel Cut-Pursuit"
echo
# Clone parallel-cut-pursuit and grid-graph repos
git clone https://gitlab.com/1a7r0ch3/parallel-cut-pursuit.git src/dependencies/parallel_cut_pursuit
git clone https://gitlab.com/1a7r0ch3/grid-graph.git src/dependencies/grid_graph

# Compile the projects
python3 scripts/setup_dependencies.py build_ext

echo
echo
echo "🚀 Successfully installed SPT"
