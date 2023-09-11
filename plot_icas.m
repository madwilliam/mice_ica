function plot_icas(mice,time)
    mat = load(['/N/slate/zw72/group_ica_per_mice/Mouse_' num2str(mice) '.mat']);
    images = mat.all_images{time};
    time_periods = IO.get_time_periods();
    time = time_periods{time};
    isbrain = IO.load_brain_mask(mice);
    n_rows=5;
    n_columns = 5;
    ploti = -1;
    n_components = size(images,1);
    for ici = 1:n_components
        if mod(ici,n_rows*n_columns)==1
            if ici~=1
                saveas(gcf,['~/Desktop/Display/group_ica_per_mice/Mouse_' num2str(mice) '_time=P' time '_plot_' num2str(ploti) '.png'])
                close all
            end
            f = figure();
            ha=tight_subplot(n_rows,n_columns,[0.03 0.03],[0.1 0.1],[0.1 0.1]);
            fhandle=gcf;
            set(gcf,'position',[1000,1000,1000,1000])
            ploti = ploti+1;
            sgtitle(['Mouse ' num2str(mice),' Time = P' time])
        end
        axis_id = ici-ploti*n_rows*n_columns;
        axis = ha(axis_id);
        hold(axis,'on')
        axes(axis)
        toplot = squeeze(images(ici,:,:));
        toplot(~isbrain) = NaN;
        h = pcolor(toplot);
        set(h, 'EdgeColor', 'none');
        hold(axis,'off')
    end
end