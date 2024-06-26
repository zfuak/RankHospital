rm(list = ls())
pacman::p_load(REBayes, data.table)
source("Code/SelectX.R")
load("Results/2013-2022/ZsLsR.Rda")
pdt <- readRDS("Results/2013-2022/pdt_used_gmm_sys.rds")
Z <- Z <- fit1d(pdt)
alpha <- 0.20
gamma <- 0.20
sL <- select1d(Z, alpha = alpha, gamma = gamma, "L")
sR <- select1d(Z, alpha = alpha, gamma = gamma, "R")
# ---- Find the min and max of the density ---- #
Z <- append(Z, list(W = Z$s)) #
u_min <- min(Z$S)
u_max <- max(Z$S)
v_min <- min(Z$W)
v_max <- max(Z$W)


# # --- Right tail --- #

# # --- pdf --- #
# pdf("Figures/2013-2022/TPKWs_MLE_R.pdf", height = 4.5, width = 8)
# par(mfrow = c(1, 2))
# TPKWs_MLE <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 5), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# pdf("Figures/2013-2022/TPKWs_PMKWs_R.pdf", height = 4.5, width = 8)
# par(mfrow = c(1, 2))
# TPKWs_PMKWs <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 4), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# pdf("Figures/2013-2022/TPKWs_JS_R.pdf", height = 4.5, width = 8)
# par(mfrow = c(1, 2))
# TPKWs_JS <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 6), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# # --- png --- #
# png("Figures/2013-2022/TPKWs_MLE_R.png", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_MLE <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 5), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# png("Figures/2013-2022/TPKWs_PMKWs_R.png", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_PMKWs <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 4), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# png("Figures/2013-2022/TPKWs_JS_R.png", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_JS <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 6), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# # --- Left tail --- #

# png("Figures/2013-2022/TPKWs_MLE_L.pdf", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_MLE <- level_plot(Z, alpha = 0.22, gamma = 0.2, tail = "L", cindex = c(2, 5), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()
# png("Figures/2013-2022/TPKWs_JS_L.pdf", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_JS <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 6), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# # --- png --- #
# png("Figures/2013-2022/TPKWs_MLE_L.png", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_MLE <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 5), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# png("Figures/2013-2022/TPKWs_PMKWs_L.png", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_PMKWs <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 4), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()

# png("Figures/2013-2022/TPKWs_JS_L.png", height = 450, width = 800)
# par(mfrow = c(1, 2))
# TPKWs_JS <- level_plot(Z, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 6), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
# dev.off()


# --- test: right--- #
grid <- grid_select(Z, alpha = alpha, gamma = gamma, tail = "R", cindex = c(2, 4, 5, 6), xgrid = seq(u_min, u_max, length = 600), ygrid = seq(v_min, v_max, length = 200))
png("Figures/2013-2022/test_R25.png", height = 450, width = 800)
par(mfrow = c(1, 2))
level_plot(Z, sR, grid, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 5), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
dev.off()
png("Figures/2013-2022/test_R24.png", height = 450, width = 800)
par(mfrow = c(1, 2))
level_plot(Z, sR, grid, alpha = 0.22, gamma = 0.05, tail = "R", cindex = c(2, 4), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
dev.off()

# --- test: left--- #
grid <- grid_select(Z, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 4, 5, 6), xgrid = seq(u_min, u_max, length = 600), ygrid = seq(v_min, v_max, length = 200))
png("Figures/2013-2022/test_L25.png", height = 450, width = 800)
par(mfrow = c(1, 2))
level_plot(Z, sL, grid, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 5), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
dev.off()
png("Figures/2013-2022/test_L24.png", height = 450, width = 800)
par(mfrow = c(1, 2))
level_plot(Z, sL, grid, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 4), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
dev.off()
png("Figures/2013-2022/test_L26.png", height = 450, width = 800)
par(mfrow = c(1, 2))
level_plot(Z, sL, grid, alpha = 0.22, gamma = 0.05, tail = "L", cindex = c(2, 6), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
dev.off()

# ---- generate plot for right/left selection comparing rule (2, 4) and (2, 5) and (2, 6) ---- #

# ---- left tail ---- #
grid_L <- grid_select(Z, alpha = alpha, gamma = gamma, tail = "L", cindex = c(2, 4, 5, 6), xgrid = seq(u_min, u_max, length = 600), ygrid = seq(v_min, v_max, length = 200))
dir.create("Figures/2013-2022/GMM/GLmix")
pdf(paste0("Figures/2013-2022/GMM/GLmix/Left_", alpha, "_", gamma, ".pdf"), height = 4.5 * 3, width = 8)
png(paste0("Figures/2013-2022/GMM/GLmix/Left_", alpha, "_", gamma, ".png"), height = 450 * 3, width = 800)
par(mfrow = c(3, 2))
for (i in c(4, 5, 6)) {
    level_plot(Z, sL, grid_L, alpha = alpha, gamma = gamma, tail = "L", cindex = c(2, i), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
}
dev.off()

# ---- right tail ---- #
grid_R <- grid_select(Z, alpha = alpha, gamma = gamma, tail = "R", cindex = c(2, 4, 5, 6), xgrid = seq(u_min, u_max, length = 600), ygrid = seq(v_min, v_max, length = 200))
pdf(paste0("Figures/2013-2022/GMM/GLmix/Right_", alpha, "_", gamma, ".pdf"), height = 4.5 * 3, width = 8)
png(paste0("Figures/2013-2022/GMM/GLmix/Right_", alpha, "_", gamma, ".png"), height = 450 * 3, width = 800)
par(mfrow = c(3, 2))
for (i in c(4, 5, 6)) {
    level_plot(Z, sR, grid_R, alpha = alpha, gamma = gamma, tail = "R", cindex = c(2, i), constraint = c("cap", "fdr"), seq(u_min, u_max, length = 600), seq(v_min, v_max, length = 200))
}
dev.off()


# ---- Focus on left tail probability ---- #
# let's write a function for the process

select_plot_1d <- function(Z, s, alpha, gamma, tail, rule_index, sub = FALSE, filename, format = "pdf") {
    Rules <- c("TPKW", "TPKWs", "PMKW", "PMKWs", "MLE", "JS")
    dt2 <- pdt[, .(hat_mu = first(hat_mu), Var_res1 = first(Var_res1), Var_res2 = first(Var_res2), Nobs = first(Nobs)), by = .(FI, STJR)]
    A <- s$A[, rule_index]
    B <- s$B[, rule_index]
    selection <- cbind(dt2, A, B)
    if (format == "pdf") {
        pdf(filename, height = 4.5, width = 8)
    } else {
        png(filename, height = 450, width = 800)
    }
    par(mfrow = c(1, 2))
    if (sub) {
        pub <- selection[STJR == 1]
        pri <- selection[STJR == 2]
    } else {
        pub <- selection[STJR == 1 | STJR == 0]
        pri <- selection[STJR == 2 | STJR == 3]
    }
    n_pub <- nrow(pub)
    n_pri <- nrow(pri)
    B_pub <- pub[B == 1]
    B_pri <- pri[B == 1]
    plot(NULL, xlim = c(u_min, u_max), ylim = c(log(v_min), log(v_max)), xlab = expression(mu), ylab = expression(sigma^2))
    points(B_pub$hat_mu, log(B_pub$Var_res1), col = 4, cex = 0.5)
    points(B_pri$hat_mu, log(B_pri$Var_res1), col = 2, cex = 0.5)
    text <- c(paste0("Public: ", nrow(B_pub), "/", n_pub), paste0("Private: ", nrow(B_pri), "/", n_pri))
    legend("topright", text, col = c(4, 2), pch = 1, cex = 0.95, bty = "n")
    mtext(paste("alpha = ", alpha, "selected: ", nrow(B_pub) + nrow(B_pri)))
    title(paste("Rule: ", Rules[rule_index]))
    A_pub <- pub[A == 1]
    A_pri <- pri[A == 1]
    plot(NULL, xlim = c(u_min, u_max), ylim = c(log(v_min), log(v_max)), xlab = expression(mu), ylab = expression(sigma^2))
    points(A_pub$hat_mu, log(A_pub$Var_res1), col = 4, cex = 0.5)
    points(A_pri$hat_mu, log(A_pri$Var_res1), col = 2, cex = 0.5)
    text <- c(paste0("Public: ", nrow(A_pub), "/", n_pub), paste0("Private: ", nrow(A_pri), "/", n_pri))
    legend("topright", text, col = c(4, 2), pch = 1, cex = 0.95, bty = "n")
    mtext(paste("alpha = ", alpha, "selected: ", nrow(A_pub) + nrow(A_pri)))
    title(paste("Rule: ", Rules[rule_index]))
    dev.off()
}

load("Results/2013-2022/pdt_dt1_dt2.Rda") # for the STJR
Rules <- c("TPKW", "TPKWs", "PMKW", "PMKWs", "MLE", "JS")
alpha <- 0.40
gamma <- 0.05
tail <- "L"
Z <- fit1d(pdt)
s <- select1d(Z, alpha = alpha, gamma = gamma, tail = tail)
for (rule_index in c(2, 4, 5)) {
    filepath <- paste0("Figures/2013-2022/Left_", alpha, "_", gamma, "_", Rules[rule_index], ".png")
    print(filepath)
    select_plot_1d(Z, s, alpha = alpha, gamma = gamma, tail = tail, rule_index, sub = FALSE, filepath, format = "png")
}
