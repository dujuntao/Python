$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot

.\.venv\Scripts\python.exe scripts\run_main4_instance_bootstrap.py --cpu
.\.venv\Scripts\python.exe scripts\make_source_selected_score_appendix.py
.\.venv\Scripts\python.exe scripts\make_paper_result_tables.py
.\.venv\Scripts\python.exe scripts\check_manuscript_static.py
.\.venv\Scripts\python.exe scripts\make_reproducibility_package.py
.\.venv\Scripts\python.exe scripts\make_row_promotion_audit.py
.\.venv\Scripts\python.exe scripts\run_missing_promoted_score_grids.py --cpu
.\.venv\Scripts\python.exe scripts\make_promoted_score_selection_audit.py
.\.venv\Scripts\python.exe scripts\make_promoted_score_selection_paper_table.py
.\.venv\Scripts\python.exe scripts\make_dataset_license_audit.py
.\.venv\Scripts\python.exe scripts\make_benchmark_artifact_manifest.py
.\.venv\Scripts\python.exe scripts\make_ed_competitiveness_plan.py
.\.venv\Scripts\python.exe scripts\run_online_shoppers_accepted_mask_bootstrap.py
.\.venv\Scripts\python.exe scripts\run_folktables_accepted_mask_bootstrap.py
.\.venv\Scripts\python.exe scripts\make_artifact_breadth_promotion_audit.py
.\.venv\Scripts\python.exe scripts\make_instability_ablation_audit.py
.\.venv\Scripts\python.exe scripts\make_instability_nature_figure.py
.\.venv\Scripts\python.exe scripts\score_rescue_bench.py evaluate-score-file --input results\main4_instance_bootstrap\instance_predictions.parquet --out-dir results\benchmark_cli_eval\main4 --coverage 0.8 --n-boot 1000 --use-accepted-column
.\.venv\Scripts\python.exe scripts\score_rescue_bench.py evaluate-score-file --input results\online_shoppers_accepted_mask_bootstrap\score_file.parquet --out-dir results\benchmark_cli_eval\online_shoppers_breadth --coverage 0.8 --n-boot 1000 --use-accepted-column
.\.venv\Scripts\python.exe scripts\score_rescue_bench.py evaluate-score-file --input results\folktables_accepted_mask_bootstrap\score_file.parquet --out-dir results\benchmark_cli_eval\folktables_breadth --coverage 0.8 --n-boot 1000 --use-accepted-column
.\.venv\Scripts\python.exe scripts\validate_benchmark_cli_metrics.py
.\.venv\Scripts\python.exe scripts\make_benchmark_artifact_package.py
.\.venv\Scripts\python.exe scripts\score_rescue_bench.py validate-artifact --strict
.\.venv\Scripts\python.exe scripts\make_reproducibility_package.py
.\.venv\Scripts\python.exe scripts\make_pdf_layout_audit.py
.\.venv\Scripts\python.exe scripts\make_neurips_ed_template_draft.py
$env:PYTHONPATH = "C:\Users\DELL\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\Lib\site-packages"
.\.venv\Scripts\python.exe scripts\make_neurips_ed_content_page_audit.py
.\.venv\Scripts\python.exe scripts\make_neurips_ed_visual_qa.py
$env:PYTHONPATH = $null
.\.venv\Scripts\python.exe scripts\make_neurips_ed_page_budget_plan.py
.\.venv\Scripts\python.exe scripts\make_reviewer_risk_audit.py
.\.venv\Scripts\python.exe scripts\make_claim_boundary_text_audit.py
.\.venv\Scripts\python.exe scripts\make_ed_framing_text_audit.py
.\.venv\Scripts\python.exe scripts\make_claim_safe_expansion_audit.py
.\.venv\Scripts\python.exe scripts\make_reproducibility_package.py
.\.venv\Scripts\python.exe scripts\make_submission_readiness_audit.py
.\.venv\Scripts\python.exe scripts\make_unified_v1_final.py
.\.venv\Scripts\python.exe scripts\make_unified_v1_fair_baseline.py
.\.venv\Scripts\python.exe scripts\make_aligned_advantage_ci.py
.\.venv\Scripts\python.exe scripts\make_certificate_split_sensitivity_report.py
.\.venv\Scripts\python.exe scripts\make_nature_style_figures_v2.py
.\.venv\Scripts\python.exe scripts\make_topconf_main_v2.py
.\.venv\Scripts\python.exe scripts\make_topconf_pdf_compile_audit_v2.py
.\.venv\Scripts\python.exe scripts\make_neurips_style_v2.py
.\.venv\Scripts\python.exe scripts\make_reviewer_premortem_v2.py
.\.venv\Scripts\python.exe scripts\make_final_submission_package_v2.py
