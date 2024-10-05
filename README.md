
# Designing Knowledge-Based Potentials via B-Spline Basis Functions for Native Proteins Detection

This repository contains the research and implementation related to the paper "Designing Knowledge-Based Potentials via B-Spline Basis Functions for Native Proteins Detection" by Elmira Mirzabeigi, Saeed Mortezazadeh, Rezvan Salehi, and Hossein Naderi-Manesh.

## Overview

This project focuses on developing knowledge-based potentials to differentiate native protein structures from decoy sets. Two distance-dependent potential energy functions were constructed using B-spline basis functions, optimized through a linear programming approach. The paper proposes two methods based on different assumptions for energy calculations to improve native structure detection accuracy.

The study explores the following key points:
1. **Protein Structure Prediction**: Utilizing Anfinsen's dogma for structure prediction.
2. **Knowledge-Based Potentials**: Extracting potential functions based on pairwise distances between Cα atoms in proteins.
3. **B-Spline Basis Functions**: Using B-spline basis functions to represent potential functions at various distances between amino acids.
4. **Optimization Schemes**: Implementing two optimization schemes using MATLAB to minimize error in detecting native structures from decoys.

## Key Features

- **Linear Programming Knowledge-Based Potentials (LPKP)**: Optimized potentials using linear programming to differentiate native and decoy structures.
- **B-Spline Representation**: The potentials are expressed using eight uniform cubic B-spline basis functions.
- **Data**: The dataset for training and testing the model consists of Titan-HRD decoy sets, available at [Titan-HRD](http://titan.princeton.edu/HRDecoys).

## Results

- **LPKP1**: Correctly identified 130 out of 150 native structures with an average rank of 1.67.
- **LPKP2**: Correctly identified 124 out of 150 native structures with an average rank of 2.83.

Both methods demonstrated promising results in accurately detecting native protein structures from an ensemble of decoys.

## Files in this Repository

- `paper_file.pdf`: The full paper detailing the methods and results of the study.
- `code/`: Contains the MATLAB scripts used for implementing the linear programming optimization schemes.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/ElmiraMirzabeigi/Designing-of-knowledge-based-potentials-via-B-spline-basis-functions-for-native-proteins-detection.git
   ```
2. Navigate to the `code/` directory and run the MATLAB scripts to reproduce the results.
3. The `data/` directory contains the protein decoy sets required for training and testing the model.

## Dependencies

- MATLAB
- Linear Programming Toolbox
- B-spline functions for protein structure modeling

## Publication

For more details, you can access the full publication [here](https://www.pulsus.com/abstract/designing-of-knowledgebased-potentials-via-bspline-basis-functions-for-native-proteins-detection-12726.html).

## Citation

If you use this repository in your research, please cite the following paper:

```
@article{mirzabeigi2023designing,
  title={Designing of knowledge-based potentials via B-spline basis functions for native proteins detection},
  author={Mirzabeigi, Elmira and Mortezazadeh, Saeed and Salehi, Rezvan and Naderi-Manesh, Hossein},
  journal={arXiv preprint arXiv:2305.05728},
  year={2023}
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
