function plot_ica_per_mice(mice)
    [oi,seedcenter] = load_basics();
    time_periods = {'15','22','28','35','60'};
    mat = load(['/N/slate/zw72/ICA_per_mice/Mouse_' num2str(mice) '.mat']);
    all_images = mat.all_images;
    mat = load(['/N/slate/zw72/average_per_mice_new/Mouse' num2str(mice) '.mat']);
    isbrain = mat.isbrain;
    n_components = size(images,1);
    n_rows=5;
    n_columns = 5;
    ploti = -1;
    for ici = 1:n_components
        if ploti ~=-1
            saveas(gcf,['~/Desktop/Display/ica_per_mice/Mouse_' num2str(mice) '_plot_' num2str(ploti) '.png'])
            close all
        end
        if mod(ici,n_rows*n_columns)==1
            f = figure();
            ha=tight_subplot(n_rows,n_columns,[0.03 0.03],[0.1 0.1],[0.1 0.1]);
            fhandle=gcf;
            set(gcf,'position',[1000,1000,1000,1000])
            ploti = ploti+1;
            sgtitle(['Mouse ' num2str(mice),' Time = P15'])
        end
        axis_id = ici-ploti*n_rows*n_columns;
        axis = ha(axis_id);
        hold(axis,'on')
        axes(axis)
        toplot = squeeze(images(ici,:,:));
        toplot(~mat.isbrain) = NaN;
        h = pcolor(toplot);
        set(h, 'EdgeColor', 'none');
        hold(axis,'off')
    end
    saveas(gcf,['~/Desktop/Display/ica_per_mice/Mouse_' num2str(mice) '_plot_' num2str(ploti) '.png'])
    close all
end