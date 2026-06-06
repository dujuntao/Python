# Score Rescuability Benchmark Artifact v1

This anonymous artifact accompanies the Score Rescuability paper. It evaluates selective-risk transfer under tabular distribution shift. The central contract fixes target coverage and reports source-validation selective risk, accepted-set target selective risk, target full risk, source-target gap, score-selection protocol, uncertainty, seed stability, and artifact sensitivity.

## Quick start

```powershell
python score_file_evaluator.py --help
python score_file_evaluator.py validate-artifact --strict
python score_file_evaluator.py evaluate-score-file --input example_score_files/tiny_score_file.csv --out-dir results/example_eval --coverage 0.8 --n-boot 50
python scripts_to_reproduce_main_tables/reproduce_table_ii.py --out reproduced_table_ii.tex
python scripts_to_reproduce_main_tables/reproduce_table_iii.py --out reproduced_table_iii.tex
python scripts/make_icdm_hardening_completion.py
```

The table reproduction scripts regenerate the source-selection audit table and the packaged headline accepted-mask provenance table from packaged CSV results. The score-file command evaluates a minimal external score file against the same metric contract.

## Artifact components

- `manifest.csv` and `manifest.json`: root copies of the benchmark task manifest.
- `score_file_evaluator.py`: root CLI wrapper for listing tasks, validating the artifact, and evaluating score files.
- `example_score_files/`: minimal CSV examples for the evaluator interface.
- `scripts_to_reproduce_main_tables/`: scripts that regenerate the source-selection audit table and headline provenance table.
- `configs/benchmark_metrics_contract_v1.json`: machine-readable metric contract.
- `results/main4_instance_bootstrap/summary.csv`: headline accepted-mask bootstrap intervals.
- `results/promoted_score_selection_audit/`: source-selected/oracle score-selection audits.
- `results/experiment_hardening/`: leakage/split audit, negative controls, paired uncertainty, conformal sanity baseline, accepted-mask manifest, Gas domain-artifact audit, external score-file demos, and reproducibility/compliance matrix.
- `BENCHMARK_CARD.md`: anonymous benchmark card and caveats.

## Score-file evaluator interface

A score file contains one row per source-validation or target example with at least `domain`, `y`, `pred`, and `score`, where `domain` is `valid` or `target` and larger `score` means more likely to accept. Optional metadata columns are `dataset`, `split`, `benchmark_id`, `score_name`, `seed`, and `accepted`.

## Table provenance

The source-selection table reports target-oracle and source-validation-selected score choices over the full score grid. The headline provenance table reports uncertainty for saved headline/promoted accepted masks; these are distinct audit layers. For Covertype `area3->area2`, the source-selection table uses the current full-grid oracle/source-selected pair (`Entropy`/`Geo`), while the headline provenance table bootstraps the saved promoted `ReAct-E` mask used by the stability audit.

## Experiment hardening

The hardening script regenerates reviewer-risk tables from packaged score files and local benchmark metadata:

- `leakage_split_audit.csv`: train/validation/target isolation and label-use audit.
- `negative_control_audit.csv`: label shuffle, score shuffle, random-score acceptance, same-domain placebo, and false-temporal-split controls.
- `paired_uncertainty_audit.csv`: paired seed-bootstrap intervals for source/oracle, simple scores, and full-risk comparisons.
- `conformal_sanity_table.csv`: conformal/risk-control sanity summary for the Folktables public-control setting.
- `accepted_mask_manifest.csv`: per-example score files and accepted-mask provenance.
- `gas_artifact_classifier_audit.csv`: Gas source-target duplicate/domain-artifact check.
- `external_score_demo_table.csv`: score-file evaluator demos beyond the tiny smoke test.
- `repro_compliance_matrix.csv`: reproducibility and compliance ledger.
- `LICENSES.md`: artifact/code license notes and third-party dataset-license pointer.

## Claim boundary

The benchmark is diagnostic. Its purpose is target-risk accounting for accepted sets under shift, not deployment-time risk certification from unlabeled target data alone.
