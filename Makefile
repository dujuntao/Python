PY=.venv/Scripts/python.exe

.PHONY: check main4 source-selected table repro-package final-v2 promotion-audit missing-score-grids score-selection-audit artifact-breadth dataset-license benchmark-artifact benchmark-validate pdf-layout-audit neurips-ed-draft reviewer-risk claim-boundary ed-framing claim-safe-expansion instability-ablation instability-figure all-readiness

check:
	$(PY) scripts/check_manuscript_static.py

main4:
	$(PY) scripts/run_main4_instance_bootstrap.py --cpu
	$(PY) scripts/check_manuscript_static.py

source-selected:
	$(PY) scripts/make_source_selected_score_appendix.py
	$(PY) scripts/check_manuscript_static.py

table:
	$(PY) scripts/make_paper_result_tables.py
	$(PY) scripts/check_manuscript_static.py

repro-package:
	$(PY) scripts/make_reproducibility_package.py

final-v2:
	$(PY) scripts/make_unified_v1_final.py
	$(PY) scripts/make_unified_v1_fair_baseline.py
	$(PY) scripts/make_aligned_advantage_ci.py
	$(PY) scripts/make_certificate_split_sensitivity_report.py
	$(PY) scripts/make_nature_style_figures_v2.py
	$(PY) scripts/make_topconf_main_v2.py
	$(PY) scripts/make_topconf_pdf_compile_audit_v2.py
	$(PY) scripts/make_neurips_style_v2.py
	$(PY) scripts/make_reviewer_premortem_v2.py
	$(PY) scripts/make_final_submission_package_v2.py

all-readiness: main4 source-selected table promotion-audit missing-score-grids score-selection-audit artifact-breadth dataset-license benchmark-artifact benchmark-validate pdf-layout-audit neurips-ed-draft reviewer-risk claim-boundary ed-framing claim-safe-expansion instability-ablation instability-figure
	$(PY) scripts/make_reproducibility_package.py
	$(PY) scripts/make_submission_readiness_audit.py


benchmark-artifact:
	$(PY) scripts/make_row_promotion_audit.py
	$(PY) scripts/run_missing_promoted_score_grids.py --cpu
	$(PY) scripts/make_promoted_score_selection_audit.py
	$(PY) scripts/make_dataset_license_audit.py
	$(PY) scripts/make_benchmark_artifact_manifest.py
	$(PY) scripts/make_ed_competitiveness_plan.py
	$(PY) scripts/run_online_shoppers_accepted_mask_bootstrap.py
	$(PY) scripts/run_folktables_accepted_mask_bootstrap.py
	$(PY) scripts/make_artifact_breadth_promotion_audit.py
	$(PY) scripts/make_instability_ablation_audit.py
	$(PY) scripts/make_instability_nature_figure.py
	$(PY) scripts/score_rescue_bench.py evaluate-score-file --input results/main4_instance_bootstrap/instance_predictions.parquet --out-dir results/benchmark_cli_eval/main4 --coverage 0.8 --n-boot 1000 --use-accepted-column
	$(PY) scripts/score_rescue_bench.py evaluate-score-file --input results/online_shoppers_accepted_mask_bootstrap/score_file.parquet --out-dir results/benchmark_cli_eval/online_shoppers_breadth --coverage 0.8 --n-boot 1000 --use-accepted-column
	$(PY) scripts/score_rescue_bench.py evaluate-score-file --input results/folktables_accepted_mask_bootstrap/score_file.parquet --out-dir results/benchmark_cli_eval/folktables_breadth --coverage 0.8 --n-boot 1000 --use-accepted-column
	$(PY) scripts/validate_benchmark_cli_metrics.py
	$(PY) scripts/make_benchmark_artifact_package.py

benchmark-validate:
	$(PY) scripts/score_rescue_bench.py validate-artifact --strict


promotion-audit:
	$(PY) scripts/make_row_promotion_audit.py


missing-score-grids:
	$(PY) scripts/run_missing_promoted_score_grids.py --cpu


score-selection-audit:
	$(PY) scripts/make_promoted_score_selection_audit.py
	$(PY) scripts/make_promoted_score_selection_paper_table.py


artifact-breadth:
	$(PY) scripts/run_online_shoppers_accepted_mask_bootstrap.py
	$(PY) scripts/run_folktables_accepted_mask_bootstrap.py
	$(PY) scripts/make_artifact_breadth_promotion_audit.py
	$(PY) scripts/score_rescue_bench.py evaluate-score-file --input results/online_shoppers_accepted_mask_bootstrap/score_file.parquet --out-dir results/benchmark_cli_eval/online_shoppers_breadth --coverage 0.8 --n-boot 1000 --use-accepted-column
	$(PY) scripts/score_rescue_bench.py evaluate-score-file --input results/folktables_accepted_mask_bootstrap/score_file.parquet --out-dir results/benchmark_cli_eval/folktables_breadth --coverage 0.8 --n-boot 1000 --use-accepted-column


dataset-license:
	$(PY) scripts/make_dataset_license_audit.py


pdf-layout-audit:
	$(PY) scripts/make_pdf_layout_audit.py


neurips-ed-draft:
	$(PY) scripts/make_neurips_ed_template_draft.py
	$(PY) scripts/make_neurips_ed_content_page_audit.py
	$(PY) scripts/make_neurips_ed_visual_qa.py
	$(PY) scripts/make_neurips_ed_page_budget_plan.py


reviewer-risk:
	$(PY) scripts/make_reviewer_risk_audit.py


claim-boundary:
	$(PY) scripts/make_claim_boundary_text_audit.py


ed-framing:
	$(PY) scripts/make_ed_framing_text_audit.py


claim-safe-expansion:
	$(PY) scripts/make_claim_safe_expansion_audit.py


instability-ablation:
	$(PY) scripts/make_instability_ablation_audit.py


instability-figure:
	$(PY) scripts/make_instability_nature_figure.py
